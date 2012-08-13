import logging

from pyramid.security import authenticated_userid

from pyconca.security import is_admin


log = logging.getLogger(__name__)


class BaseView(object):

    def __init__(self, request):
        self.request = request
        self._configure()
        self.body = {
            'logged_in': authenticated_userid(self.request),
            'is_admin': self.is_admin
        }

    @property
    def id(self):
        if 'id' in self.request.matchdict:
            return self.request.matchdict['id']

    @property
    def is_admin(self):
        return is_admin(self.request)

    #---------- views

    def index(self):
        return self._respond()

    def get(self):
        return self._respond(id=self.id)

    def update(self):
        return self._respond(id=self.id, is_create=False)

    def create(self):
        return self._respond(is_create=True)

    #---------- abstract hooks

    def _configure(self):
        pass

    #---------- response helpers

    def _respond(self, **kwargs):
        self.body.update(kwargs)
        return self.body
