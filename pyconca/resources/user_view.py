from formencode import All
from formencode import FancyValidator
from formencode import Invalid
from formencode import Schema
from formencode import validators

from pyramid.httpexceptions import HTTPFound
from pyramid.security import remember

from pyconca.dao.user_dao import UserDao
from pyconca.resources.base_view import BaseView
from pyconca.security import generate_password


class UserView(BaseView):

    def _configure(self):
        self.name = 'user'
        self.dao = UserDao()
        self.schema = UserSchema

    def _populate(self, user, is_create):
        user.first_name = self.request.params['first_name']
        user.last_name = self.request.params['last_name']
        user.username = self.request.params['username']
        user.email = self.request.params['email']
        user.password =  generate_password(self.request.params['password'])

    def _post_save(self, id, is_create):
        if is_create:
            home = self.request.route_url('index')
            headers = remember(self.request, id)
            return HTTPFound(location=home, headers=headers)
        else:
            return BaseView._post_save(self, id, is_create)


class UniqueUsername(FancyValidator):

    def __init__(self, *args, **kwargs):
        FancyValidator.__init__(self, *args, **kwargs)
        self.user_dao = UserDao()

    def _to_python(self, value, state):
        if self.user_dao.username_already_exists(value, state.id):
            raise Invalid('That username already exists', value, state)
        return value


class UserSchema(Schema):
    first_name = validators.String(not_empty=True, strip=True)
    last_name = validators.String(not_empty=True, strip=True)
    username = All(
        validators.String(not_empty=True, strip=True),
        UniqueUsername()
    )
    password = validators.String(not_empty=True, strip=True)
    password_confirm = validators.String(not_empty=True, strip=True)
    email = validators.String(not_empty=True, strip=True)
    chained_validators = [
        validators.FieldsMatch('password', 'password_confirm')
    ]
