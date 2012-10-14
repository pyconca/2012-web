import logging

from pyramid.security import authenticated_userid

from pyconca.context import Context


log = logging.getLogger(__name__)


class BaseView(Context):

    def __init__(self, request):
        Context.__init__(self, request)
        self.body = {
            'logged_in': authenticated_userid(self.request),
            'is_admin': self.is_admin
        }
        self._configure()

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
