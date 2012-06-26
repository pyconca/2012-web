import logging

from pyramid.security import authenticated_userid
from pyramid.url import route_url


log = logging.getLogger(__name__)


class BaseView(object):

    def __init__(self, request):
        self.request = request
        self._configure()

    @property
    def id(self):
        if 'id' in self.request.matchdict:
            return self.request.matchdict['id']

    #---------- resource views

    def index(self):
        response_ = self._build_response()
        return response_

    def get(self):
        response_ = self._build_response()
        response_['id'] = self.id
        return response_

    def update(self):
        response_ = self._build_response()
        response_['id'] = self.id
        save_url = self._route_url('update', id=self.id)
        response_[self.name + '_save_url'] = save_url
        return response_

    def create(self):
        response_ = self._build_response()
        save_url = self._route_url('create')
        response_[self.name + '_save_url'] = save_url
        return response_

    #---------- abstract hooks

    def _configure(self):
        pass

    #---------- response helpers

    def _build_response(self, validation_dict=None):
        return {
            'logged_in': authenticated_userid(self.request),
            'validation_dict': validation_dict,
            self.name + '_index_url': self._route_url('index'),
            self.name + '_create_url': self._route_url('create'),
            self.name + '_get_url': self._route_url('get', id=''),
            self.name + '_update_url': self._route_url('update', id=''),
            self.name + '_delete_url': self._route_url('delete', id=''),
        }

    def _route_url(self, action, **kwargs):
        return route_url(self.name + '_' + action, self.request, **kwargs)
