import unittest
import transaction

from pyramid import testing

from .models import DBSession

class TestIndex(unittest.TestCase):
    def setUp(self):
        self.request = testing.DummyRequest()
        self.config = testing.setUp(request=self.request)

    def tearDown(self):
        DBSession.remove()
        testing.tearDown()

    def test_index_not_logged_in(self):
        from .views import index
        self.request.user = None

        info = index(self.request)

        self.assertEquals(None, info['logged_in'])
        self.assertFalse(info['is_admin'])

    def test_index_logged_in(self):
        from .views import index
        self.config.testing_securitypolicy(
            userid='hank',
            permissive=True)
        self.config.add_route('login', '/login')
        self.request.user = None

        info = index(self.request)

        self.assertEquals('hank', info['logged_in'])
        self.assertFalse(info['is_admin'])
