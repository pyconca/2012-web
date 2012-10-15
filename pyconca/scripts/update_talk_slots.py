# -*- coding: utf-8 -*-
import os
import re
import sys
from collections import namedtuple
from datetime import datetime, timedelta

import transaction
from pyramid.paster import get_appsettings
from pyramid.paster import setup_logging
from sqlalchemy import engine_from_config

# !!!!!! WARNING !!!!!!
# DO NOT HAND EDIT THIS
# !!!!!! WARNING !!!!!!
# Update the "Talk Schedule" spreadsheet:
#    https://docs.google.com/a/pycon.ca/spreadsheet/ccc?key=0Akocld_Y2HsLdEcyVTdZTmJxSWpYRWdoVU5aZXo0UWc#gid=1
# Then copy+paste the entire spreadsheet in here
# Run this file directly (or pass the --dry-run argument) to preview changes
# !!!!!! WARNING !!!!!!
# DO NOT HAND EDIT THIS
# !!!!!! WARNING !!!!!!
schedule = u"""
Day 1	Main hall					Lower hall					Tutorial			
9:30	K1		Jessica McKellar											
10:25	B1	#74	Mike Bayer	The SQLAlchemy Session - In Depth		A1	#19	Trevor Bekolay	Writing self-documenting scientific code using physical quantities		T1	#6	Anthony Scopatz	HDF5 is for Lovers
10:50						A2	#29	Vid Ayer	MongoDB and Gene databases					
11:20	B2	#40	Mike Fletcher	Profiling for Performance		A3	#36	Adam Goucher	A really, really, really, fast tour of WebDriver					
11:45						A4	#45	Mark Côté	Network programming for automation developers					
13:05	B3	#73	Brandon Rhodes	The Python Æsthetic: Beauty and Warts in Languages and in Code		A5	#47	Vlad Filippov	Supercharge web application prototypes with the App Engine Python SDK		T2	#61	David Warde-Farley	Introduction to Numerical and Scientific Computing with Python
13:30						A6	#41	Joan Touzet	Hit the Flask and Get Some REST: Rewriting the Cloudant API in a Single Python Back End					
14:00	B4	#12	Matthew Hooker	Configuration management with ZooKeeper		A7	#28	Lynn Root	3 Projects to Make Python Stick for New Coders					
14:25						A8	#43	Christopher Lambacher	Everything you wanted to know about deploying web apps on Windows but were too horrified to ask					
15:00	B5		Daniel Lindsley			A9	#21	Tres Seaver	Lightweight Web Services with Pyramid					
15:25						A10	#7	Blaise Laflamme	Pyramid Layout: Composable UI/UX for Pyramid					
15:55	A11		Meredith L. Patterson	Don't be afraid to fail in public		A13	#23	James King	Distributed Programming in Python: A Model for Strong, Eventual Consistency					
16:20	A12	#51	Éric Araujo	How you can contribute to Python		A14	#53	Yannick Hold	Once you Scoop, no need to fork					
16:50	L1	#1	Sam Bull	Django Developer		A15	#44	Mahdi Yusuf	Twisted History of Python Packaging					
16:57	L2	#38	Todd Whiteman	Python development with Komodo IDE										
17:04	L3		Douglas Cerna	SchoolTool										
17:15	L4	#10	Robert Park	Manipulating Photo Metadata in Python		A16	#32	Martin Alderete	NINJA-IDE, an IDE specially designed for Python					
17:22	L5	#56	Ian Douglas	Using SendGrid Email APIs to Bring Your Eh? Game										
17:29	L6	#59	Evan Hicks	Python and Kyotocabinet: Memory Mapped Storage										
														
Day 2	Main hall					Lower hall					Tutorial			
9:15	K2		Michael Feathers											
10:10	B6	#4	Kenneth Reitz	Python For Humans		A17	#67	Steve Singer	Python in your database					
10:35						A18	#33	Javier de la Rosa	Graph Databases in Python					
11:10	B7	#34	Dan Callahan	Beyond Passwords: Secure Authentication with Mozilla Persona		A19	#31	Taavi Burns	Server Log Analysis with Pandas		T3	#54	Alexandre Bourget	Gevent-socketio, cross-framework real-time web live demo
11:35						A20	#2	Mazdak Rezvani	Dancing with Big Data: Disco + Inferno					
12:55	B8	#75	Sandy Walsh	Introduction to OpenStack		A21	#55	Ash Christopher	Horizontally Scaling Your Database with Django		T4	#14	Greg Ward	Fast, Faster, Fastest: Getting the Best Performance From Python
13:20						A22	#42	Diego Muñoz Escalante	An Ember.js adapter for Django					
13:50	B9	#60	Andrew Francis	How to Solve a Problem Like Santa Claus		A23	#58	Gabriel Grant	Distributed, Real-time Web Apps with Stack.io					
14:15						A24	#15	Ian Ward	Cool Stuff You Can Do With Urwid					
14:50	A25	#76	Elizabeth Leddy	I Wish I Knew How to Quit You: Secrets to sustainable Python communities		A27	#37	Maxime Noël	DynamoDB and DynamoDB-Mapper -- Building scalable Python applications with Amazon's NoSQL database					
15:15	A26	#3	Adam McKerlie	Testing Django with Travis CI		A28	#26	Anna Filina	Speed Up Your Database					
15:45	L7	#64	Karen Bennet	Integrating Geocode Data with Python		A29	#18	Chayim Kirshen	Programmatically Managing Python Workloads Across Multiple Clouds					
15:52	L8	#30	Dimitri Gnidash	Success Rate of Technology Projects										
15:59	L9	#68	Bonnie King	GPIO on the Raspberry Pi										
16:10	L10	#22	Albert O'Connor	Wilderness Labs		A30		TBD (Google)						
16:17	L11	#46	Ram Venkat	Statistical Data Exchange and Publishing - an introduction to SDMX and DSPL										
16:24	L12	#50	Ashwin Panchapakesan	A Pure Python Genetic Algorithms Framework										
16:40	K3		Fernando Pérez											
"""
# !!!!!! WARNING !!!!!!
# DO NOT HAND EDIT THIS
# !!!!!! WARNING !!!!!!

Slot = namedtuple("Slot", "start end room code talk")
Talk = namedtuple("Talk", "id owner_name")

def _parse_schedule(schedule):
    start_date = datetime(year=2012, month=11, day=9, hour=0, minute=0, second=0)
    day = None

    for lineno, line in enumerate(schedule.splitlines()):
        try:
            if not line.strip():
                continue
            day_m = re.search("^Day (\d)", line)
            if day_m:
                day = int(day_m.group(1))
                continue

            time_m = re.search("^(\d+):(\d+)", line)
            assert time_m
            assert day
            hour, minute = map(int, time_m.groups())

            s = Slot(
                start=start_date + timedelta(days=day, hours=hour, minutes=minute),
                end=None,
                code=None,
                room=None,
                talk=None,
            )
            have_talk_id = None
            for col, val in enumerate(line.split("\t")):
                if have_talk_id:
                    assert val, "unexepctedly empty val: %r" %(val, )
                    s = s._replace(talk=Talk(id=have_talk_id, owner_name=val))
                    have_talk_id = None
                    continue

                talk_m = re.search("^#(\d+)$", val)
                if talk_m:
                    have_talk_id = int(talk_m.group(1))
                    continue

                code_m = re.search("^([ABKTL]\d+)$", val)
                if code_m:
                    if s.code is not None:
                        yield s
                    s = s._replace(
                        room=["Main hall", "Lower hall", "Tutorial room"][col // 5],
                        code=code_m.group(0),
                        talk=None,
                    )
            if s.code:
                yield s


        except Exception:
            print "Error while processing line %r: %s" %(lineno, line)
            import traceback, sys
            traceback.print_exception(*sys.exc_info())
            return


def parse_schedule(schedule):
    durations = {
        "A": 20,
        "B": 45,
        "K": 45,
        "L": 5,
        "T1": 90,
        "T2": 180,
        "T3": 45,
        "T4": 120,
    }
    for slot in _parse_schedule(schedule):
        duration = durations.get(slot.code[0]) or durations[slot.code]
        end_time = slot.start + timedelta(minutes=duration)
        yield slot._replace(end=end_time)


def usage(argv):
    cmd = os.path.basename(argv[0])
    print "usage: %s [--dry-run] [--ignore-errors] <config_uri>" % (cmd, )
    print "example: '%s development.ini'" % (cmd, )
    print "NOTE: This will update the database to correspond to the table in"
    print "          ", __file__
    print "      This will overwrite (but also back up) any changes made "
    print "      manually to the database."


def main(argv=sys.argv):
    from pyconca.models import DBSession, ScheduleSlot, Talk, TalkScheduleSlot

    ignore_errors = False
    if "--ignore-errors" in argv:
        argv.remove("--ignore-errors")
        ignore_errors = True

    if len(argv) != 2:
        usage(argv)
        return 1

    if "--dry-run" in argv:
        print "\n".join(map(str, parse_schedule(schedule)))
        return 0

    config_uri = argv[1]
    setup_logging(config_uri)
    settings = get_appsettings(config_uri)
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)

    dumpdb = os.path.join(os.path.dirname(__file__), "../../prod_mysqldump")
    if os.path.exists(dumpdb):
        print "Running %r..." %(dumpdb, )
        res = os.system(dumpdb)
        if res:
            return res

    with transaction.manager:
        for slot in parse_schedule(schedule):
            s = DBSession.query(ScheduleSlot).filter_by(code=slot.code).first()
            if s is None:
                s = ScheduleSlot()
            vals = slot._asdict()
            talk = vals.pop("talk")
            s.__dict__.update(vals)
            DBSession.add(s)
            if talk:
                t = DBSession.query(Talk).filter_by(id=talk.id).first()
                if not t:
                    if ignore_errors:
                        continue
                    raise Exception("invalid talk: %r" %(talk, ))
                actual_talk_owner = "%s %s" %(t.owner.first_name, t.owner.last_name)
                assert actual_talk_owner.lower() == talk.owner_name.lower(), \
                        "bad data? owners don't match: %r != %r" %(
                            actual_talk_owner, talk.owner_name)
                ts = DBSession.query(TalkScheduleSlot).filter_by(talk_id=t.id).first()
                if not ts:
                    ts = TalkScheduleSlot()
                    ts.talk_id = t.id
                ts.schedule_slot = s
                DBSession.add(ts)
        DBSession.flush()

if __name__ == "__main__":
    print "\n".join(map(str, parse_schedule(schedule)))
