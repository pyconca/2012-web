from pyramid.httpexceptions import HTTPFound
from pyramid.security import authenticated_userid
from pyramid.security import forget
from pyramid.security import remember
from pyramid.view import view_config
from pyramid.view import forbidden_view_config

from .security import USERS


@view_config(route_name='index', renderer='index.mako')
def index(request):
    return _build_response(request)


@view_config(route_name='about', renderer='about.mako')
def about_us(request):
    return _build_response(request)


@view_config(route_name='venue', renderer='venue.mako')
def venue(request):
    return _build_response(request)


def _build_response(request):
    return {'logged_in': authenticated_userid(request)}


@view_config(route_name='logout')
def logout(request):
    headers = forget(request)
    home = request.route_url('index')
    return HTTPFound(location=home, headers=headers)


@view_config(route_name='login', renderer='pyconca:templates/auth/login.mako')
@forbidden_view_config(renderer='pyconca:templates/auth/login.mako')
def login(request):
    login_url = request.route_url('login')
    referrer = request.url
    if referrer == login_url:
        referrer = '/' # never use the login form itself as came_from
    came_from = request.params.get('came_from', referrer)

    message = ''
    login = ''
    password = ''
    if 'login.submit' in request.params:
        login = request.params['login']
        password = request.params['password']
        if USERS.get(login) == password:
            headers = remember(request, login)
            return HTTPFound(location=came_from, headers=headers)
        message = 'Failed login'

    response_ = _build_response(request)
    response_.update(
        message=message,
        came_from=came_from,
        login=login,
        password=password,
    )

    return response_
