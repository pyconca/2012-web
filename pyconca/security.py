from pyramid.security import authenticated_userid
from pyramid.security import unauthenticated_userid
from pyramid.security import Allow
from pyramid.security import Everyone

from pyconca.dao.user_dao import UserDao


USERS = {'diana':'diana', 'taavi':'taavi'}
PERMISSIONS = {'admin':['group:admin']}


def get_user(request):
    username = unauthenticated_userid(request)
    if username:
        user_dao = UserDao()
        return user_dao.get_by_username(username)


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
    ]

    def __init__(self, request):
        username = authenticated_userid(request)
        user = request.user
        if (username and user and 'id' in request.matchdict and
            user.id == int(request.matchdict['id'])):
                self.__acl__.append((Allow, username, 'user_get'))
                self.__acl__.append((Allow, username, 'user_update'))
