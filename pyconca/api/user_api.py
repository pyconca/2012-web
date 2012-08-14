from formencode import All
from formencode import FancyValidator
from formencode import Invalid
from formencode import Schema
from formencode import validators

from pyconca.api.base_api import BaseApi
from pyconca.dao.user_dao import UserDao
from pyconca.security import generate_password


class UserApi(BaseApi):

    def _configure(self):
        self.name = 'user'
        self.dao = UserDao(self.request.user)
        self.schema = UserSchema

    def _populate(self, user, form, is_create):
        user.first_name = form['first_name']
        user.last_name = form['last_name']
        user.username = form['username']
        user.email = form['email']
        user.password = generate_password(form['password'])

    def _create_flash(self, user):
        msg = ('You have signed up for PyCon Canada!')
        self.request.session.flash(msg, 'success')

    def _update_flash(self, user):
        msg = ('Updated user: %s' % (user.username))
        self.request.session.flash(msg, 'success')


class UniqueUsername(FancyValidator):

    def __init__(self, *args, **kwargs):
        FancyValidator.__init__(self, *args, **kwargs)
        self.user_dao = UserDao(None)

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
