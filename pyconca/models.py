from sqlalchemy import Column
from sqlalchemy import ForeignKey
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import Enum
from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy.orm import scoped_session
from sqlalchemy.orm import sessionmaker
from zope.sqlalchemy import ZopeTransactionExtension

from pyconca.util import camel_to_under


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


class User(AttrMixIn, Base):
    id = Column(Integer, primary_key=True)
    username = Column(String(length=100), unique=True, nullable=False)
    password = Column(String(length=100), nullable=False)
    first_name = Column(String(length=100), nullable=False)
    last_name = Column(String(length=100), nullable=False)
    email = Column(String(length=100), nullable=False)
    groups = relationship('Group', secondary='user_group')

    def to_dict(self):
        return {
            'id': self.id,
            'username': self.username,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'email': self.email,
        }


class Group(AttrMixIn, Base):
    id = Column(Integer, primary_key=True)
    name = Column(String(length=30), unique=True, nullable=False)


class UserGroup(AttrMixIn, Base):
    user_id = Column(Integer, ForeignKey('user.id'), primary_key=True)
    group_id = Column(Integer, ForeignKey('group.id'), primary_key=True)


#TODO not sure if Enum is good enough.. so I leave the code here in case they
#   are needed later on
#class ChoiceType(types.TypeDecorator):

    #impl = types.String

    #def __init__(self, choices, **kwargs):
        #self.choices = dict(choices)
        #super(ChoiceType, self).__init__(**kwargs)

    #def process_bind_param(self, value, dialect):
        #return [k for k, v in self.choices.iteritems() if v == value][0]

    #def process_result_value(self, value, dialect):
        #return self.choices[value]


class Talk(AttrMixIn, Base):
    id = Column(Integer, primary_key=True)
    owner_id = Column(Integer, ForeignKey('user.id'))
    title = Column(String(length=100), nullable=False)
    type = Column(Enum('talk', 'tutorial', 'other', name='talk_type'),
                  nullable=False)
    level = Column(Enum('novice', 'experienced', name='talk_level'),
                   nullable=False)
    abstract = Column(String(length=400), nullable=False)
    outline = Column(String(), nullable=False)
    reviewer_notes = Column(String(), nullable=False)

    def to_dict(self):
        return {
            'id': self.id,
            'owner_id': self.owner_id,
            'title': self.title,
            'type': self.type,
            'level': self.level,
            'abstract': self.abstract,
            'outline': self.outline,
            'reviewer_notes': self.reviewer_notes,
        }
