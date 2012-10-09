from datetime import datetime

import os
import sys
import transaction

from pyramid.paster import get_appsettings
from pyramid.paster import setup_logging

from sqlalchemy import engine_from_config

from ..models import Base
from ..models import DBSession
from ..models import Group
from ..models import User
from ..models import ScheduleSlot
from ..models import Talk
from ..security import generate_password


def usage(argv):
    cmd = os.path.basename(argv[0])
    print('usage: %s <config_uri>\n'
          '(example: "%s development.ini")' % (cmd, cmd))
    sys.exit(1)


def main(argv=sys.argv):
    if len(argv) != 2:
        usage(argv)
    config_uri = argv[1]
    setup_logging(config_uri)
    settings = get_appsettings(config_uri)
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)
    Base.metadata.create_all(engine)
    with transaction.manager:
        admin_group = Group(name='admin')
        DBSession.add(admin_group)
        taavi = User(
            username='taavi',
            password=generate_password('taavi'),
            first_name='Taavi',
            last_name='Burns',
            email='foo@example.com')
        diana = User(
            username='diana',
            password=generate_password('diana'),
            first_name='Diana',
            last_name='Clarke',
            email='bar@example.com')
        #kay = User(
            #username='kay',
            #password=generate_password('kay'),
            #first_name='kay',
            #last_name='zhu',
            #email='no.deep.sea@gmail.com')
        DBSession.add(taavi)
        diana.groups.append(admin_group)
        DBSession.add(diana)
        #kay.groups.append(admin_group)
        #DBSession.add(kay)
    with transaction.manager:
        taavi = DBSession.query(User).filter(User.username == 'taavi').one()
        schedule_slot = ScheduleSlot(
            room='Upstairs',
            start=datetime(2012, 11, 10, 15, 0),
            end=datetime(2012, 11, 10, 15, 30),
            code="X1",
        )
        DBSession.add(schedule_slot)
        talk = Talk(
            owner_id=taavi.id,
            title='Title',
            type='talk',
            level='novice',
            abstract='Abstract',
            outline='Outline',
            schedule_slot=schedule_slot)
        talk.schedule_slot = schedule_slot
        DBSession.add(talk)
