from mock import patch
from webtest import TestApp
import json
import transaction
import unittest

from pyconca import DBSession
from pyconca import main
from pyconca.security import generate_password

@patch('pyconca.views.check_password', lambda x, y: True)
class TestWithWebtest(unittest.TestCase):
    def setUp(self):
        self.testapp = TestApp(main(
            {},
            **{
                'sqlalchemy.url':'sqlite:///',
                'secret.authn_policy':'so_secret',
                'secret.unencrypted_cookie':'itsaseekreet',
                'mako.directories':'pyconca:templates',
            }
        ))
        from pyconca.models import (
            Base,
            User,
            UserGroup,
            Group,
            Talk,
        )
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
        for k, v in response.cookies_set.items():
            headers = {'Set-Cookie': "%s='%s'" % (k, v)}
        self.assertEquals('302 Found', response.status)
        return headers

    def test_root(self):
        response = self.testapp.get('/', status=200)
        self.assertEquals('200 OK', response.status)
        self.failUnless('<title>PyCon Canada</title>' in response.body, response.body)

    def test_login(self):
        logged_in_headers = self._loginAs('admin')
        index_response = self.testapp.get('/', headers=logged_in_headers, status=200)
        self.failUnless('Logout' in index_response.body)
        self.failIf('Login' in index_response.body)

    ### USER API

    def test_user_api_index__not_logged_in(self):
        response = self.testapp.get('/user.json', status=403)
        data = json.loads(response.body)
        self.assertEquals({}, data['data'])

    def test_user_api_index__as_admin(self):
        logged_in_headers = self._loginAs('admin')
        response = self.testapp.get('/user.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(2, len(data['data']['user_list']))

    def test_user_api_index__as_speaker(self):
        logged_in_headers = self._loginAs('speaker')
        response = self.testapp.get('/user.json', status=403)
        data = json.loads(response.body)
        self.assertEquals({}, data['data'])

    def test_user_api_get__not_logged_in(self):
        response = self.testapp.get('/user/2.json', status=403)
        data = json.loads(response.body)
        self.assertEquals({}, data['data'])

    def test_user_api_get_admin__as_admin(self):
        logged_in_headers = self._loginAs('admin')
        response = self.testapp.get('/user/1.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(1, data['data']['user']['id'])

    def test_user_api_get_speaker__as_admin(self):
        logged_in_headers = self._loginAs('admin')
        response = self.testapp.get('/user/2.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(2, data['data']['user']['id'])

    def test_user_api_get_admin__as_speaker(self):
        logged_in_headers = self._loginAs('speaker')
        response = self.testapp.get('/user/1.json', status=403)
        data = json.loads(response.body)
        self.assertEquals({}, data['data'])

    def test_user_api_get_speaker__as_speaker(self):
        logged_in_headers = self._loginAs('speaker')
        response = self.testapp.get('/user/2.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(2, data['data']['user']['id'])

    ### TALK API

    def test_talk_api_index__not_logged_in(self):
        response = self.testapp.get('/talk.json', status=403)
        data = json.loads(response.body)
        self.assertEquals({}, data['data'])

    def test_talk_api_index__as_admin(self):
        logged_in_headers = self._loginAs('admin')
        response = self.testapp.get('/talk.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(2, len(data['data']['talk_list']))

    def test_talk_api_index__as_speaker(self):
        logged_in_headers = self._loginAs('speaker')
        response = self.testapp.get('/talk.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(1, len(data['data']['talk_list']), data)
        self.assertEquals(self._speaker_talk_id, data['data']['talk_list'][0]['id'])
        self.assertEquals(self._speaker_id, data['data']['talk_list'][0]['owner_id'])
        self.assertEquals('stitle', data['data']['talk_list'][0]['title'])

    def test_talk_api_get__not_logged_in(self):
        response = self.testapp.get('/talk/11.json', status=403)
        data = json.loads(response.body)
        self.assertEquals({}, data['data'])

    def test_talk_api_get_admin__as_admin(self):
        logged_in_headers = self._loginAs('admin')
        response = self.testapp.get('/talk/11.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(self._admin_talk_id, data['data']['talk']['id'])

    def test_talk_api_get_speaker__as_admin(self):
        logged_in_headers = self._loginAs('admin')
        response = self.testapp.get('/talk/12.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(self._speaker_talk_id, data['data']['talk']['id'])

    def test_talk_api_get_admin__as_speaker(self):
        logged_in_headers = self._loginAs('speaker')
        response = self.testapp.get('/talk/11.json', status=403)
        data = json.loads(response.body)
        self.assertEquals({}, data['data'])

    def test_talk_api_get_speaker__as_speaker(self):
        logged_in_headers = self._loginAs('speaker')
        response = self.testapp.get('/talk/12.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(self._speaker_talk_id, data['data']['talk']['id'])
