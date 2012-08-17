import unittest
import transaction

from pyramid import testing
from sqlalchemy import create_engine

from pyconca.models import DBSession


class TestIndexFunctional(unittest.TestCase):
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
        from pyconca.views import index

        info = index(self.request)

        self.assertEquals(None, info['logged_in'])
        self.assertFalse(info['is_admin'])

    def test_index_logged_in_admin(self):
        from pyconca.views import index

        with transaction.manager:
            self._loggedInAdmin()
            info = index(self.request)

        self.assertEquals('pyramid_admin', info['logged_in'])
        self.assertTrue(info['is_admin'])

    def test_index_logged_in_speaker(self):
        from pyconca.views import index

        with transaction.manager:
            self._loggedInStaff()
            info = index(self.request)

        self.assertEquals('pyramid_speaker', info['logged_in'])
        self.assertFalse(info['is_admin'])
