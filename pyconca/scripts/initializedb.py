import os
import sys
import transaction

from pyramid.paster import get_appsettings
from pyramid.paster import setup_logging

from sqlalchemy import engine_from_config

from ..models import Base
from ..models import DBSession
from ..models import User

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
        taavi = User(username='taavi', first_name='Taavi', last_name='Burns')
        diana = User(username='diana', first_name='Diana', last_name='Clarke')
        DBSession.add(taavi)
        DBSession.add(diana)
