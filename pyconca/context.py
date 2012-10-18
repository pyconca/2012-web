from pyconca.security import is_admin
from pyconca.security import get_user

from pyconca.dao.talk_dao import TalkDao


class Context(object):

    def __init__(self, request):
        self.request = request

    @property
    def id(self):
        if 'id' in self.request.matchdict:
            return self.request.matchdict['id']

    @property
    def is_admin(self):
        return is_admin(self.request)

    @property
    def is_talk_owner(self):
        if self.id:
            talk_dao = TalkDao(self.request.user)
            return get_user(self.request) == talk_dao.get_owner(self.id)
        return None
