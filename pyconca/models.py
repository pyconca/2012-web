import os
import hashlib

from datetime import datetime
from datetime import timedelta

from sqlalchemy import Column
from sqlalchemy import Boolean
from sqlalchemy import Unicode
from sqlalchemy import DateTime
from sqlalchemy import ForeignKey
from sqlalchemy import Index
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import Text
from sqlalchemy import Enum
from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import backref
from sqlalchemy.orm import relationship
from sqlalchemy.orm import scoped_session
from sqlalchemy.orm import sessionmaker
from zope.sqlalchemy import ZopeTransactionExtension

from pyramid.security import Allow
from pyramid.security import Everyone
from pyramid.security import ALL_PERMISSIONS

from pyconca.temporal import local_isoformat
from pyconca.util import camel_to_under

ACTIVATION_AGE = timedelta(days=3)

DBSession = scoped_session(sessionmaker(extension=ZopeTransactionExtension()))
Base = declarative_base()


class AttrMixIn(object):

    @declared_attr
    def __tablename__(cls):
        return camel_to_under(cls.__name__)

    @declared_attr
    def __table_args__(cls):
        return {
            'mysql_engine': 'InnoDB',
            'mysql_charset': 'utf8'
        }


class Activation(AttrMixIn, Base):
    """ Handles activation and password reset items for users.

    Activation serves mainly two purposes:
    1. when user signup, keep track if their provided email is legit by sending
    them an activation link. Only users who have click through the provided
    activation link will have a 'legit' email addresses that we can safely send
    emails to.
    2. when user tries to reset password, keep track of time-limited resetting
    links sent to user

    The id is the user's id. Each user can have at most one valid activation in
    process at a time.

    The code should be a random unique hash that is only valid for a certain
    period of time. After it will be invalid.

    The create_by can be used to identify: new user registeration,
    password reset
    """

    id = Column(Integer, ForeignKey('user.id'), primary_key=True)
    code = Column(Unicode(60))
    valid_until = Column(DateTime,
                         default=lambda: datetime.now + ACTIVATION_AGE)
    created_by = Column(Unicode(100))

    def __init__(self, created_by):
        self.code = Activation._gen_activation_hash()
        self.created_by = created_by
        self.valid_until = datetime.now() + ACTIVATION_AGE

    @staticmethod
    def _gen_activation_hash():
        return hashlib.sha256(os.urandom(256)).hexdigest()[::2]


class User(AttrMixIn, Base):
    id = Column(Integer, primary_key=True)
    username = Column(String(length=100), unique=True, nullable=False)
    password = Column(String(length=100), nullable=False)
    first_name = Column(String(length=100), nullable=False)
    last_name = Column(String(length=100), nullable=False)
    email = Column(String(length=100), nullable=False, unique=True)
    groups = relationship('Group', secondary='user_group')
    talks = relationship('Talk', backref='user')
    activated = Column(Boolean, default=False)
    activation = relationship('Activation', uselist=False, backref='user')

    #def __init__(self):
        #"""By default a user starts out deactivated"""
        ## TODO think of this through
        #self.activation = Activation('signup')
        #self.activated = False

    def mark_pwd_reset(self, creator):
        """Put the account through the reactivation process
        """
        # if we reactivate then reinit this
        if self.activation is not None:
            DBSession.delete(self.activation)
        self.activation = Activation(creator)
        self.activated = False

    @property
    def __acl__(self):
        return [
            (Allow, 'group:admin', ALL_PERMISSIONS),

            (Allow, self.id, 'user_get'),
            (Allow, self.id, 'api_user_get'),

            (Allow, self.id, 'user_update'),
            (Allow, self.id, 'api_user_update'),
        ]

    @property
    def is_admin(self):
        return 'admin' in [group.name for group in self.groups]

    def to_dict(self, is_admin):
        return {
            'id': self.id,
            'username':  self.username,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'email': self.email
        }


class Group(AttrMixIn, Base):
    id = Column(Integer, primary_key=True)
    name = Column(String(length=30), unique=True, nullable=False)


class UserGroup(AttrMixIn, Base):
    user_id = Column(Integer, ForeignKey('user.id'), primary_key=True)
    group_id = Column(Integer, ForeignKey('group.id'), primary_key=True)


class Talk(AttrMixIn, Base):
    id = Column(Integer, primary_key=True)
    owner_id = Column(Integer, ForeignKey('user.id'))
    owner = relationship('User')
    title = Column(String(length=100), nullable=False)
    type = Column(Enum('talk', 'tutorial', 'other', name='talk_type'),
                  nullable=False)
    level = Column(Enum('novice', 'experienced', name='talk_level'),
                   nullable=False)
    bio = Column(String(length=500), nullable=False)
    abstract = Column(String(length=400), nullable=False)
    outline = Column(Text(), nullable=False)
    reviewer_notes = Column(Text(), default='')
    schedule_slot = relationship('ScheduleSlot',
                                 backref=backref('talk', uselist=False),
                                 secondary='talk_schedule_slot',
                                 single_parent=True,
                                 uselist=False)

    @property
    def __acl__(self):
        return [
            (Allow, 'group:admin', ALL_PERMISSIONS),

            (Allow, Everyone, 'talk_get'),
            (Allow, Everyone, 'api_talk_get'),

            (Allow, self.owner_id, 'talk_update'),
            (Allow, self.owner_id, 'api_talk_update'),
        ]

    def to_dict(self, is_admin, is_talk_owner):
        data = {
            'id': self.id,
            'title': self.title,
            'owner_id': self.owner_id,
            'speaker_first_name': self.user.first_name,
            'speaker_last_name': self.user.last_name,
            'bio': self.bio,
            'type': self.type,
            'level': self.level,
            'abstract': self.abstract,
        }

        if is_admin or is_talk_owner:
            data['outline'] = self.outline

        if is_admin:
            data['reviewer_notes'] = self.reviewer_notes
            data['user'] = self.user.to_dict(is_admin)

        return data


class ScheduleSlot(AttrMixIn, Base):
    id = Column(Integer, primary_key=True)
    room = Column(String(length=100), nullable=False)
    start = Column(DateTime, nullable=False)
    end = Column(DateTime, nullable=False)
    code = Column(String(length=8), nullable=False, unique=True)

    def to_dict(self, is_admin):
        duration_delta = self.end - self.start
        data = {
            'id': self.id,
            'room': self.room,
            'start': local_isoformat(self.start),
            'end': local_isoformat(self.end),
            'duration': duration_delta.seconds / 60,
            'code': self.code,
        }
        return data


class TalkScheduleSlot(AttrMixIn, Base):
    talk_id = Column(Integer, ForeignKey('talk.id'), primary_key=True)
    schedule_slot_id = Column(Integer, ForeignKey('schedule_slot.id'),
                              primary_key=True)
    schedule_slot = relationship('ScheduleSlot')


Index('talk_schedule_slot_talk_id_unique',
    TalkScheduleSlot.talk_id, unique=True)
Index('talk_schedule_slot_schedule_slot_id_unique',
    TalkScheduleSlot.schedule_slot_id, unique=True)
