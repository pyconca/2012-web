from formencode import Invalid

from pyramid.httpexceptions import HTTPFound
from pyramid.url import route_url

import logging


log = logging.getLogger(__name__)


class FormencodeState(object):
    pass


class BaseApi(object):

    def __init__(self, request):
        self.request = request
        self._configure()
        self.state = FormencodeState()

    @property
    def id(self):
        if 'id' in self.request.matchdict:
            return self.request.matchdict['id']

    #---------- resource views

    def index(self):
        response_ = self._build_response()
        models = self.dao.index()
        response_['data'][self.name + '_list'] = [m.to_dict() for m in models]
        return response_

    def get(self):
        response_ = self._build_response(self.id)
        model = self.dao.get(self.id)
        response_['data'][self.name] = model.to_dict()
        return response_

    def delete(self):
        model = self.dao.get(self.id)
        if self.is_post:
            self.dao.delete(model)
        return self._post_delete()

    def update(self):
        model = self.dao.get(self.id)
        return self._save(model, is_create=False)

    def create(self):
        model = self.dao.create()
        return self._save(model, is_create=True)

    #---------- abstract hooks

    def _configure(self):
        pass

    def _populate(self):
        pass

    #---------- where next

    def _post_delete(self):
        index_url = self._route_url('index')
        return HTTPFound(location=index_url)

    def _post_save(self, id, is_create):
        get_url = self._route_url('get', id=id)
        return HTTPFound(location=get_url)

    #---------- persist helpers

    def _save(self, model, is_create):
        validation_dict = None
        if self.is_post:
            try:
                self._persist(model, is_create)
                return self._post_save(model.id, is_create)
            except Invalid as e:
                validation_dict = e.error_dict
        response_ = self._build_response(validation_dict=validation_dict)
        self._wrap_model(model, is_create)
        response_[self.name] = model
        return response_

    def _state(self, model, is_create):
        self.state.id = self.id

    def _persist(self, model, is_create):
        self._state(model, is_create)
        self._validate(model, is_create)
        self._populate(model, is_create)
        self.dao.save(model)

    def _validate(self, model, is_create):
        form = self._get_form_fields(self.schema)
        self.schema.to_python(form, self.state)

    def _get_form_fields(self, schema):
        return {field: self.request.params[field] for field in schema.fields}

    #---------- response helpers

    def _wrap_model_list(self, models):
        for model in models:
            self._wrap_model(model)

    def _wrap_model(self, model, is_create=False):
        if is_create:
            model.save_url = self._route_url('create')
        else:
            model.get_url = self._route_url('get', id=model.id)
            model.update_url = self._route_url('update', id=model.id)
            model.delete_url = self._route_url('delete', id=model.id)
            model.save_url = model.update_url

    def _build_response(self, validation_dict=None):
        return {
            'errors':{},
            'data':{},
            'validation_dict': validation_dict,
        }

    def _route_url(self, action, **kwargs):
        return route_url(self.name + '_' + action, self.request, **kwargs)

    #---------- miscellaneous helpers

    @property
    def is_post(self):
        return self.request.environ['REQUEST_METHOD'] == 'POST'
