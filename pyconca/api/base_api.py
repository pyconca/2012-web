import json
import logging

from formencode import Invalid

from pyramid.response import Response
from pyramid.view import forbidden_view_config

from pyconca.context import Context


log = logging.getLogger(__name__)

HTTP_STATUS_200 = '200 OK'
HTTP_STATUS_201 = '201 Created'
HTTP_STATUS_400 = '400 Bad Request'
HTTP_STATUS_403 = '403 Forbidden'
HTTP_STATUS_404 = '404 Not Found'


class FormencodeState(object):
    pass


def is_api_request(info, request):
    return request.environ['PATH_INFO'].endswith('.json') is True


class BaseApi(Context):

    def __init__(self, request):
        Context.__init__(self, request)
        self._configure()
        self.state = FormencodeState()
        self.body = {'errors': [], 'data': {}}

    #---------- views

    def index(self):
        models = self.dao.index()
        self.body['data'][self.name + '_list'] = [
            self._post_process_for_output(m, m.to_dict(self.is_admin))
            for m in models
        ]
        return self._respond(HTTP_STATUS_200)

    def get(self):
        model = self.dao.get(self.id)
        if model is None:
            return self._respond(HTTP_STATUS_404)
        self.body['data'][self.name] = \
            self._post_process_for_output(model, model.to_dict(self.is_admin))
        return self._respond(HTTP_STATUS_200)

    def delete(self):
        model = self.dao.get(self.id)
        self.dao.delete(model)
        return self._respond(HTTP_STATUS_200)

    def update(self):
        model = self.dao.get(self.id)
        try:
            self._persist(model, is_create=False)
            self._update_flash(model)
            return self._respond(HTTP_STATUS_200)
        except Invalid as invalid_exception:
            self._add_validation_errors(invalid_exception)
            return self._respond(HTTP_STATUS_400)

    def create(self):
        self.model = self.dao.create()
        try:
            self._persist(self.model, is_create=True)
            self._create_flash(self.model)
            return self._respond(HTTP_STATUS_201)
        except Invalid as invalid_exception:
            self._add_validation_errors(invalid_exception)
            return self._respond(HTTP_STATUS_400)

    #---------- abstract hooks

    def _configure(self):
        pass

    def _populate(self, model, form, is_create):
        pass

    def _post_process_for_output(self, model, output):
        return output

    def _create_flash(self, model):
        pass

    def _update_flash(self, model):
        pass

    #---------- persist helpers

    def _state(self, model):
        self.state.id = self.id

    def _persist(self, model, is_create):
        form = json.loads(self.request.body)[self.name]
        self._state(model)
        self._validate(model, form)
        self._populate(model, form, is_create)
        self.dao.save(model)

    def _validate(self, model, form):
        self.schema.to_python(form, self.state)

    #---------- response helpers

    def _add_validation_errors(self, invalid_exception):
        for field, message in invalid_exception.error_dict.items():
            error = {'field': field, 'message': message.msg}
            self.body['errors'].append(error)

    def _respond(self, status):
        return Response(
            status=status,
            body=json.dumps(self.body, indent=2, sort_keys=True),
            content_type='application/json')
