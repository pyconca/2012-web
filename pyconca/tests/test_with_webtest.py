from paste.util.multidict import MultiDict
from webtest import TestApp
import json
import transaction
import unittest

from pyconca import DBSession
from pyconca import main
from pyconca.security import generate_password

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
        )
        Base.metadata.drop_all(DBSession.bind)
        Base.metadata.create_all(DBSession.bind)
        with transaction.manager:
            self._admin_id = 1
            self._speaker_id = 2
            admin = User(id=self._admin_id, username='admin', password=generate_password('admin'), first_name='Admin', last_name='Istrator', email='example@example.com')
            speaker = User(id=self._speaker_id, username='speaker', password=generate_password('speaker'), first_name='Spe', last_name='Aker', email='speaker@example.com')
            admin_group = Group(name='admin')
            admin.groups.append(admin_group)
            for model in (admin, speaker, admin_group):
                DBSession.add(model)

    def tearDown(self):
        DBSession.remove()

    def _loginAs(self, username, password):
        response = self.testapp.post('/login', {
            'login.submit':'Login',
            'username':username,
            'password':password,
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
        logged_in_headers = self._loginAs('admin', 'admin')
        index_response = self.testapp.get('/', headers=logged_in_headers, status=200)
        self.failUnless('Logout' in index_response.body)
        self.failIf('Login' in index_response.body)

    def test_user_api_index__not_logged_in(self):
        response = self.testapp.get('/user.json', status=403)
        data = json.loads(response.body)
        self.assertEquals({}, data['data'])

    def test_user_api_index__as_admin(self):
        logged_in_headers = self._loginAs('admin', 'admin')
        response = self.testapp.get('/user.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(2, len(data['data']['user_list']))

    def test_user_api_index__as_speaker(self):
        logged_in_headers = self._loginAs('speaker', 'speaker')
        response = self.testapp.get('/user.json', status=403)
        data = json.loads(response.body)
        self.assertEquals({}, data['data'])

    def test_user_api_get__not_logged_in(self):
        response = self.testapp.get('/user/2.json', status=403)
        data = json.loads(response.body)
        self.assertEquals({}, data['data'])

    def test_user_api_get_admin__as_admin(self):
        logged_in_headers = self._loginAs('admin', 'admin')
        response = self.testapp.get('/user/1.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(1, data['data']['user']['id'])

    def test_user_api_get_speaker__as_admin(self):
        logged_in_headers = self._loginAs('admin', 'admin')
        response = self.testapp.get('/user/2.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(2, data['data']['user']['id'])

    def test_user_api_get_admin__as_speaker(self):
        logged_in_headers = self._loginAs('speaker', 'speaker')
        response = self.testapp.get('/user/1.json', status=403)
        data = json.loads(response.body)
        self.assertEquals({}, data['data'])

    def test_user_api_get_speaker__as_speaker(self):
        logged_in_headers = self._loginAs('speaker', 'speaker')
        response = self.testapp.get('/user/2.json', status=200)
        data = json.loads(response.body)
        self.assertEquals(2, data['data']['user']['id'])
