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
            email='foo')
        diana = User(
            username='diana',
            password=generate_password('diana'),
            first_name='Diana',
            last_name='Clarke',
            email='foo')
        DBSession.add(taavi)
        diana.groups.append(admin_group)
        DBSession.add(diana)
