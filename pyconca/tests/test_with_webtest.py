from datetime import datetime
from mock import patch
from webtest import TestApp
import json
import os
import transaction
import unittest

from pyconca import DBSession
from pyconca import main
from pyconca.security import generate_password
from pyconca.models import Base
from pyconca.models import User
from pyconca.models import UserGroup
from pyconca.models import Group
from pyconca.models import Talk
from pyconca.models import ScheduleSlot
from pyconca.models import TalkScheduleSlot

@patch('pyconca.views.check_password', lambda x, y: True)
@patch('pyconca.locale.locale_from_browser', lambda x: 'en')
class TestWithWebtest(unittest.TestCase):
    def setUp(self):
        self.testapp = TestApp(main(
            {},
            **{
                'sqlalchemy.url': os.environ.get('DB', 'sqlite://'),
                'secret.authn_policy':'so_secret',
                'secret.unencrypted_cookie':'itsaseekreet',
                'mako.directories':'pyconca:templates',
            }
        ))
        Base.metadata.drop_all(DBSession.bind)
        Base.metadata.create_all(DBSession.bind)
        with transaction.manager:
            self._admin_id = 1
            self._speaker_id = 2
            self._admin_talk_id = 11
            self._speaker_talk_id = 12
            admin = User(id=self._admin_id, username='admin', password='admin', first_name='Admin', last_name='Istrator', email='example@example.com')
            speaker = User(id=self._speaker_id, username='speaker', password='speaker', first_name='Spe', last_name='Aker', email='speaker@example.com')
            admin_group = Group(name='admin')
            admin.groups.append(admin_group)
            admin_talk = Talk(id=self._admin_talk_id, owner_id=self._admin_id, title="atitle", type="talk", level="novice", abstract="aabstract", outline="aoutline", reviewer_notes="areviewer_notes")
            speaker_talk = Talk(id=self._speaker_talk_id, owner_id=self._speaker_id, title="stitle", type="tutorial", level="experienced", abstract="sabstract", outline="soutline", reviewer_notes="sreviewer_notes")
            for model in (admin, speaker, admin_group, admin_talk, speaker_talk):
                DBSession.add(model)

    def tearDown(self):
        DBSession.remove()

    def _loginAs(self, who):
        response = self.testapp.post('/login', {
            'login.submit':'Login',
            'username':who,
            'password':who,
        })
        self.assertEquals('302 Found', response.status)

    def _getJsonFrom(self, uri, who=None, **kwargs):
        if who is not None:
            headers = self._loginAs(who)
        response = self.testapp.get(uri, **kwargs)
        return json.loads(response.body)

    def test_root(self):
        response = self.testapp.get('/', status=200)
        self.assertEquals('200 OK', response.status)
        self.failUnless('<title>PyCon Canada</title>' in response.body, response.body)

    def test_login(self):
        self._loginAs('admin')
        index_response = self.testapp.get('/', status=200)
        self.failUnless('Logout' in index_response.body, index_response.body)
        self.failIf('Login' in index_response.body, index_response.body)

    ### USER API

    def test_user_api_index__not_logged_in(self):
        data = self._getJsonFrom('/user.json', status=403)
        self.assertEquals({}, data['data'])

    def test_user_api_index__as_admin(self):
        data = self._getJsonFrom('/user.json', who='admin', status=200)
        self.assertEquals(2, len(data['data']['user_list']))

    def test_user_api_index__as_speaker(self):
        data = self._getJsonFrom('/user.json', who='speaker', status=403)
        self.assertEquals({}, data['data'])

    def test_user_api_get__not_logged_in(self):
        data = self._getJsonFrom('/user/2.json', status=403)
        self.assertEquals({}, data['data'])

    def test_user_api_get_admin__as_admin(self):
        data = self._getJsonFrom('/user/1.json', who='admin', status=200)
        self.assertEquals(self._admin_id, data['data']['user']['id'])

    def test_user_api_get_speaker__as_admin(self):
        data = self._getJsonFrom('/user/2.json', who='admin', status=200)
        self.assertEquals(self._speaker_id, data['data']['user']['id'])

    def test_user_api_get_admin__as_speaker(self):
        data = self._getJsonFrom('/user/1.json', who='speaker', status=403)
        self.assertEquals({}, data['data'])

    def test_user_api_get_speaker__as_speaker(self):
        data = self._getJsonFrom('/user/2.json', who='speaker', status=200)
        self.assertEquals(self._speaker_id, data['data']['user']['id'])

    ### TALK API

    def _assertTalkNotScheduled(self, data):
        self.assertTrue(data['data']['talk']['room'] is None)
        self.assertTrue(data['data']['talk']['start'] is None)
        self.assertTrue(data['data']['talk']['end'] is None)
        self.assertTrue(data['data']['talk']['duration'] is None)

    def test_talk_api_index__not_logged_in(self):
        data = self._getJsonFrom('/talk.json', status=403)
        self.assertEquals({}, data['data'])

    def test_talk_api_index__as_admin(self):
        data = self._getJsonFrom('/talk.json', who='admin', status=200)
        self.assertEquals(2, len(data['data']['talk_list']))

    def test_talk_api_index__as_speaker(self):
        data = self._getJsonFrom('/talk.json', who='speaker', status=200)
        self.assertEquals(1, len(data['data']['talk_list']), data)
        self.assertEquals(self._speaker_talk_id, data['data']['talk_list'][0]['id'])
        self.assertEquals(self._speaker_id, data['data']['talk_list'][0]['owner_id'])
        self.assertEquals('stitle', data['data']['talk_list'][0]['title'])

    def test_talk_api_get__not_logged_in(self):
        data = self._getJsonFrom('/talk/11.json', status=403)
        self.assertEquals({}, data['data'])

    def test_talk_api_get_admin__as_admin(self):
        data = self._getJsonFrom('/talk/11.json', who='admin', status=200)
        self.assertEquals(self._admin_talk_id, data['data']['talk']['id'])
        self._assertTalkNotScheduled(data)

    def test_talk_api_get_speaker__as_admin(self):
        data = self._getJsonFrom('/talk/12.json', who='admin', status=200)
        self.assertEquals(self._speaker_talk_id, data['data']['talk']['id'])
        self._assertTalkNotScheduled(data)

    def test_talk_api_get_admin__as_speaker(self):
        data = self._getJsonFrom('/talk/11.json', who='speaker', status=403)
        self.assertEquals({}, data['data'])

    def test_talk_api_get_speaker__as_speaker(self):
        data = self._getJsonFrom('/talk/12.json', who='speaker', status=200)
        self.assertEquals(self._speaker_talk_id, data['data']['talk']['id'])
        self._assertTalkNotScheduled(data)

    def test_talk_api_unscheduled(self):
        start = datetime(2012, 11, 10, 15, 00)
        end = datetime(2012,11,10,15,30)
        with transaction.manager:
            talk = DBSession.query(Talk).get(self._admin_talk_id)
            slot = ScheduleSlot(id=101, room="room", start=start, end=end, talk=talk)
            DBSession.add(slot)
        data = self._getJsonFrom('/talk/11.json', who='admin', status=200)
        self.assertEquals("room", data['data']['talk']['room'])
        self.assertEquals("2012-11-10T10:00:00-05:00", data['data']['talk']['start'])
        self.assertEquals("2012-11-10T10:30:00-05:00", data['data']['talk']['end'])
        self.assertEquals(30, data['data']['talk']['duration'])
