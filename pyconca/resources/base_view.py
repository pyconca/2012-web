from formencode import Invalid

from pyramid.httpexceptions import HTTPFound
from pyramid.renderers import get_renderer
from pyramid.url import route_url

import logging

log = logging.getLogger(__name__)

def site_layout():
    renderer = get_renderer('pyconca:templates/layout.pt')
    layout = renderer.implementation().macros['layout']
    return layout

class BaseView(object):

    def __init__(self, request):
        self.request = request
        self._configure()

    #---------- resource views

    def index(self):
        response_ = self._build_response()
        models = self.dao.index()
        self._wrap_model_list(models)
        response_[self.name + '_list'] = models
        return response_

    def show(self):
        id = self.request.matchdict['id']
        response_ = self._build_response()
        model = self.dao.get(id)
        self._wrap_model(model)
        response_[self.name] = model
        return response_

    def delete(self):
        id = self.request.matchdict['id']
        model = self.dao.get(id)
        if self.is_post:
            self.dao.delete(model)
        index_url = self._route_url('index')
        return HTTPFound(location=index_url)

    def update(self):
        id = self.request.matchdict['id']
        model = self.dao.get(id)
        return self._save(model, is_create=False)

    def create(self):
        model = self.dao.create()
        return self._save(model, is_create=True)

    #---------- abstract hooks

    def _configure(self):
        pass

    def _populate(self):
        pass

    #---------- persist helpers

    def _save(self, model, is_create):
        validation_dict = None
        if self.is_post:
            try:
                self._persist(model, is_create)
                show_url = self._route_url('show', id=model.id)
                return HTTPFound(location=show_url)
            except Invalid as e:
                validation_dict = e.error_dict
        response_ = self._build_response(validation_dict=validation_dict)
        self._wrap_model(model, is_create)
        response_[self.name] = model
        return response_

    def _persist(self, model, is_create):
        self._validate(model, is_create)
        self._populate(model, is_create)
        self.dao.save(model)

    def _validate(self, model, is_create):
        form = self._get_form_fields(self.schema)
        self.schema.to_python(form)

    def _get_form_fields(self, schema):
        return {field:self.request.params[field] for field in schema.fields}

    #---------- response helpers

    def _wrap_model_list(self, models):
        for model in models:
            self._wrap_model(model)

    def _wrap_model(self, model, is_create=False):
        if is_create:
            model.save_url = self._route_url('create')
        else:
            model.show_url = self._route_url('show', id=model.id)
            model.update_url = self._route_url('update', id=model.id)
            model.delete_url = self._route_url('delete', id=model.id)
            model.save_url = model.update_url

    def _build_response(self, validation_dict=None):
        return {
            'layout': site_layout(),
            'validation_dict': validation_dict,
            'index_url': self._route_url('index'),
            'create_url': self._route_url('create'),
        }

    def _route_url(self, action, **kwargs):
        return route_url(self.name + '_' + action, self.request, **kwargs)

    #---------- miscellaneous helpers

    @property
    def is_post(self):
        return self.request.environ['REQUEST_METHOD'] == 'POST'
