import bcrypt

from pyramid.security import authenticated_userid
from pyramid.security import unauthenticated_userid
from pyramid.security import Allow
from pyramid.security import Authenticated
from pyramid.security import Everyone

from pyconca.dao.user_dao import UserDao
from pyconca.dao.talk_dao import TalkDao


PERMISSIONS = {'admin': ['group:admin']}


def generate_password(password):
    return bcrypt.hashpw(password, bcrypt.gensalt())


def check_password(password, hashed):
    def _constant_time_is_equal(a, b):
        result = len(a) ^ len(b)
        for x, y in zip(a, b):
            result |= ord(x) ^ ord(y)
        return result == 0
    return _constant_time_is_equal(bcrypt.hashpw(password, hashed), hashed)


def is_admin(request):
    if getattr(request, 'user'):
        groups = [group.name for group in request.user.groups]
        return 'admin' in groups
    return False


def get_user(request):
    user_id = unauthenticated_userid(request)
    if user_id:
        user_dao = UserDao(None)
        return user_dao.get(user_id)


def permission_finder(username, request):
    permissions = []
    user = request.user
    if user:
        for group in user.groups:
            permissions.extend(PERMISSIONS.get(group.name, []))
    return permissions


class RootFactory(object):
    __acl__ = [
        (Allow, 'group:admin', 'admin')
    ]

    def __init__(self, request):
        pass


class UserFactory(object):
    __acl__ = [
        (Allow, Everyone, 'user_create'),
        (Allow, 'group:admin', 'user_index'),
        (Allow, 'group:admin', 'user_get'),
        (Allow, 'group:admin', 'user_update'),
        (Allow, 'group:admin', 'user_delete'),

        (Allow, Everyone, 'api_user_create'),
        (Allow, 'group:admin', 'api_user_index'),
        (Allow, 'group:admin', 'api_user_get'),
        (Allow, 'group:admin', 'api_user_update'),
        (Allow, 'group:admin', 'api_user_delete'),
    ]

    def __init__(self, request):
        pass


class TalkFactory(object):
    __acl__ = [
        (Allow, Authenticated, 'talk_create'),
        (Allow, 'group:admin', 'talk_index'),
        (Allow, 'group:admin', 'talk_get'),
        (Allow, 'group:admin', 'talk_update'),
        (Allow, 'group:admin', 'talk_delete'),

        (Allow, Authenticated, 'api_talk_create'),
        (Allow, 'group:admin', 'api_talk_index'),
        (Allow, 'group:admin', 'api_talk_get'),
        (Allow, 'group:admin', 'api_talk_update'),
        (Allow, 'group:admin', 'api_talk_delete'),
    ]

    def __init__(self, request):
        pass

