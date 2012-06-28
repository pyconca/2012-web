import json
import logging

from formencode import Invalid

from pyramid.response import Response


log = logging.getLogger(__name__)


class FormencodeState(object):
    pass


class BaseApi(object):

    def __init__(self, request):
        self.request = request
        self._configure()
        self.state = FormencodeState()
        self.body = {'errors':{}, 'data':{}}

    @property
    def id(self):
        if 'id' in self.request.matchdict:
            return self.request.matchdict['id']

    #---------- views

    def index(self):
        models = self.dao.index()
        self.body['data'][self.name + '_list'] = [m.to_dict() for m in models]
        return self._respond(200)

    def get(self):
        model = self.dao.get(self.id)
        self.body['data'][self.name] = model.to_dict()
        return self._respond(200)

    def delete(self):
        if self.is_post:
            model = self.dao.get(self.id)
            self.dao.delete(model)
            return self._respond(200)

    def update(self):
        if self.is_post:
            model = self.dao.get(self.id)
            try:
                self._persist(model)
                return self._respond(200)
            except Invalid as invalid_exception:
                self._add_validation_errors(invalid_exception)
                return self._respond(400)

    def create(self):
        if self.is_post:
            model = self.dao.create()
            try:
                self._persist(model)
                return self._respond(201)
            except Invalid as invalid_exception:
                self._add_validation_errors(invalid_exception)
                return self._respond(400)

    #---------- abstract hooks

    def _configure(self):
        pass

    def _populate(self, model, form):
        pass

    #---------- persist helpers

    def _state(self, model):
        self.state.id = self.id

    def _persist(self, model):
        form = json.loads(self.request.body)[self.name]
        self._state(model)
        self._validate(model, form)
        self._populate(model, form)
        self.dao.save(model)

    def _validate(self, model, form):
        self.schema.to_python(form, self.state)

    #---------- response helpers

    def _add_validation_errors(self, invalid_exception):
        for field, message in invalid_exception.error_dict.items():
            self.body['errors'][field] = message.msg

    def _respond(self, status):
        return Response(
            status=status,
            body=json.dumps(self.body),
            content_type='application/json')

    #---------- miscellaneous helpers

    @property
    def is_post(self):
        return self.request.environ['REQUEST_METHOD'] == 'POST'
