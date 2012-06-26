import json
import logging

from formencode import Invalid


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
        response_ = self._build_response()
        model = self.dao.get(self.id)
        response_['data'][self.name] = model.to_dict()
        return response_

    def delete(self):
        response_ = self._build_response()
        if self.is_post:
            model = self.dao.get(self.id)
            self.dao.delete(model)
        return response_

    def update(self):
        model = self.dao.get(self.id)
        return self._save(model, is_create=False)

    def create(self):
        model = self.dao.create()
        return self._save(model, is_create=True)

    #---------- abstract hooks

    def _configure(self):
        pass

    def _populate(self, model, form, is_create):
        pass

    #---------- persist helpers

    def _save(self, model, is_create):
        response_ = self._build_response()
        if self.is_post:
            try:
                self._persist(model, is_create)
                return response_
            except Invalid as e:
                for field, message in e.error_dict.items():
                    response_['errors'][field] = message.msg
        return response_

    def _state(self, model, is_create):
        self.state.id = self.id

    def _persist(self, model, is_create):
        form = json.loads(self.request.body)[self.name]
        self._state(model, is_create)
        self._validate(model, form, is_create)
        self._populate(model, form, is_create)
        self.dao.save(model)

    def _validate(self, model, form, is_create):
        self.schema.to_python(form, self.state)

    #---------- response helpers

    def _build_response(self):
        return {'errors':{}, 'data':{}}

    #---------- miscellaneous helpers

    @property
    def is_post(self):
        return self.request.environ['REQUEST_METHOD'] == 'POST'
