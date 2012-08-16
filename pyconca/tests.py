import unittest
import transaction

from pyramid import testing
from sqlalchemy import create_engine

from .models import DBSession

# This duck will QUACK
import pyconca
pyconca.includeme = lambda configurator: None


class TestIndexFunctional(unittest.TestCase):
    def setUp(self):
        self.request = testing.DummyRequest()
        self.request.user = None
        self.config = testing.setUp(request=self.request)
        self.config.include('pyconca')

        engine = create_engine('sqlite://')
        DBSession.configure(bind=engine)

        from .models import (
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
        from .models import User
        self.request.user = DBSession.query(User).get(self._admin_id)
        self.config.testing_securitypolicy(
            userid='pyramid_admin',
            permissive=True)

    def _loggedInStaff(self):
        from .models import User
        self.request.user = DBSession.query(User).get(self._speaker_id)
        self.config.testing_securitypolicy(
            userid='pyramid_speaker',
            permissive=True)

    def test_index_not_logged_in(self):
        from .views import index

        info = index(self.request)

        self.assertEquals(None, info['logged_in'])
        self.assertFalse(info['is_admin'])

    def test_index_logged_in_admin(self):
        from .views import index

        with transaction.manager:
            self._loggedInAdmin()
            info = index(self.request)

        # testing_securitypolicy gives us pyramid_admin
        self.assertEquals('pyramid_admin', info['logged_in'])

        # Having the fixtures and remember()ing user_id=1 gives us is_admin
        self.assertTrue(info['is_admin'])

    def test_index_logged_in_speaker(self):
        from .views import index

        with transaction.manager:
            self._loggedInStaff()
            info = index(self.request)

        # testing_securitypolicy gives us pyramid_speaker
        self.assertEquals('pyramid_speaker', info['logged_in'])

        # Having the fixtures and remember()ing user_id=1 gives us is_admin
        self.assertFalse(info['is_admin'])
