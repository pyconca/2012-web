import os
import sys

from pyramid.paster import get_appsettings
from pyramid.paster import setup_logging

from sqlalchemy import engine_from_config

from ..models import Base
from ..models import DBSession


def usage(argv):
    cmd = os.path.basename(argv[0])
    print "usage: %s <config_uri>" % (cmd, )
    print "example: '%s development.ini'" % (cmd, )
    print "NOTE: This is safe to run in production!"
    print "It will only create tables which don't exist."


def main(argv=sys.argv):
    if len(argv) != 2:
        usage(argv)
        sys.exit(1)
    config_uri = argv[1]
    setup_logging(config_uri)
    settings = get_appsettings(config_uri)
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)
    Base.metadata.create_all(engine)
