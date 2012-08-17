import json
import unittest
import transaction

from mock import patch
from pyramid import testing
from sqlalchemy import create_engine

from pyconca.models import DBSession
import pyconca.tests

class TestTalkApi(unittest.TestCase):
    def setUp(self):
        self.request = testing.DummyRequest()
        self.request.user = None
        self.config = testing.setUp(request=self.request)
        self.config.include('pyconca')

        engine = create_engine('sqlite://')
        DBSession.configure(bind=engine)

        from pyconca.models import (
            Base,
            User,
            UserGroup,
            Group,
            Talk
            )
        Base.metadata.create_all(engine)
        with transaction.manager:
            self._admin_id = 1
            self._speaker_id = 2
            for model in (
                User(id=self._admin_id, username='admin', password='', first_name='Admin', last_name='Istrator', email='example@example.com'),
                User(id=self._speaker_id, username='speaker', password='', first_name='Spe', last_name='Aker', email='speaker@example.com'),
                Group(id=1, name='admin'),
                UserGroup(user_id=self._admin_id, group_id=1),
                Talk(id=self._admin_id, owner_id=self._admin_id, title='Admin Title', type='talk', level='experienced', abstract='Abstract', outline='Outline', reviewer_notes='Reviewed?'),
                Talk(id=self._speaker_id, owner_id=self._speaker_id, title='Speaker Title', type='tutorial', level='novice', abstract='Strabact', outline='Silhouette', reviewer_notes='Viewed again.'),
                ):
                DBSession.add(model)

    def tearDown(self):
        DBSession.remove()
        testing.tearDown()

    def _loggedInAdmin(self):
        from pyconca.models import User
        # This plus the fixtures gives us info['is_admin'] == True
        self.request.user = DBSession.query(User).get(self._admin_id)
        # This gives us info['logged_in'] == 'pyramid_admin'
        self.config.testing_securitypolicy(
            userid='pyramid_admin',
            permissive=True)

    def _loggedInStaff(self):
        from pyconca.models import User
        self.request.user = DBSession.query(User).get(self._speaker_id)
        self.config.testing_securitypolicy(
            userid='pyramid_speaker',
            permissive=True)

    def test_index_not_logged_in(self):
        from pyconca.api.talk_api import TalkApi

        response = TalkApi(self.request).index()

        self.assertEquals('200 OK', response.status)
        responseData = json.loads(response.body)
        self.assertEquals([], responseData['errors'])
        self.assertEquals([], responseData['data']['talk_list'])

    @patch('pyconca.api.talk_api.route_url', lambda *args, **kwargs: "Foo")
    def test_index_logged_in_admin(self):
        from pyconca.api.talk_api import TalkApi

        with transaction.manager:
            self._loggedInAdmin()
            response = TalkApi(self.request).index()

        self.assertEquals('200 OK', response.status, response)
        responseData = json.loads(response.body)
        self.assertEquals([], responseData['errors'])
        self.assertEquals(2, len(responseData['data']['talk_list']))

    @patch('pyconca.api.talk_api.route_url', lambda *args, **kwargs: "Foo")
    def test_index_logged_in_speaker(self):
        from pyconca.api.talk_api import TalkApi

        with transaction.manager:
            self._loggedInStaff()
            response = TalkApi(self.request).index()

        self.assertEquals('200 OK', response.status)
        responseData = json.loads(response.body)
        self.assertEquals([], responseData['errors'])
        self.assertEquals(1, len(responseData['data']['talk_list']))
        self.assertEquals(self._speaker_id, responseData['data']['talk_list'][0]['owner_id'])
