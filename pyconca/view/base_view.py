import logging

from pyramid.security import authenticated_userid


log = logging.getLogger(__name__)


class BaseView(object):

    def __init__(self, request):
        self.request = request
        self._configure()

    @property
    def id(self):
        if 'id' in self.request.matchdict:
            return self.request.matchdict['id']

    #---------- views

    def index(self):
        return self._build_response()

    def get(self):
        return self._build_response(id=self.id)

    def update(self):
        return self._build_response(id=self.id, is_create=False)

    def create(self):
        return self._build_response(is_create=True)

    #---------- abstract hooks

    def _configure(self):
        pass

    #---------- response helpers

    def _build_response(self, **kwargs):
        response_ = {'logged_in': authenticated_userid(self.request)}
        response_.update(kwargs)
        return response_
