import bcrypt

from pyramid.security import authenticated_userid
from pyramid.security import unauthenticated_userid
from pyramid.security import Allow
from pyramid.security import Everyone

from pyconca.dao.user_dao import UserDao


PERMISSIONS = {'admin':['group:admin']}


def generate_password(password):
    return bcrypt.hashpw(password, bcrypt.gensalt())


def check_password(password, hashed):
    def _constant_time_is_equal(a, b):
        result = len(a) ^ len(b)
        for x, y in zip(a, b):
            result |= ord(x) ^ ord(y)
        return result == 0
    return _constant_time_is_equal(bcrypt.hashpw(password, hashed), hashed)


def get_user(request):
    user_id = unauthenticated_userid(request)
    if user_id:
        user_dao = UserDao()
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
        user_id = authenticated_userid(request)
        user = request.user
        if (user_id and user and 'id' in request.matchdict and
            user.id == int(request.matchdict['id'])):
                self.__acl__.append((Allow, user_id, 'user_get'))
                self.__acl__.append((Allow, user_id, 'api_user_get'))

                self.__acl__.append((Allow, user_id, 'user_update'))
                self.__acl__.append((Allow, user_id, 'api_user_update'))
