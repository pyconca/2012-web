from pyramid.httpexceptions import HTTPFound
from pyramid.security import authenticated_userid
from pyramid.security import forget
from pyramid.security import remember
from pyramid.view import view_config
from pyramid.view import forbidden_view_config

from pyconca.dao.user_dao import UserDao
from pyconca.security import check_password
from pyconca.security import is_admin
from pyconca.locale import locale_cookie_headers
from pyramid.i18n import get_locale_name


@view_config(route_name='index', renderer='index.mako')
def index(request):
    return _build_response(request)


@view_config(route_name='about', renderer='about.mako')
def about_us(request):
    return _build_response(request)


@view_config(route_name='venue', renderer='venue.mako')
def venue(request):
    return _build_response(request)


@view_config(route_name='schedule', renderer='schedule.mako')
def schedule(request):
    return _build_response(request)


@view_config(route_name='speakers', renderer='speakers.mako')
def speakers(request):
    return _build_response(request)


@view_config(route_name='learn', renderer='learn.mako')
def learn(request):
    return _build_response(request)


@view_config(route_name='sponsors', renderer='sponsors.mako')
def sponsors(request):
    return _build_response(request)


@view_config(route_name='contact', renderer='contact.mako')
def contact(request):
    return _build_response(request)


@view_config(route_name='conduct', renderer='conduct.mako')
def conduct(request):
    return _build_response(request)


def _build_response(request):
    return {
        'logged_in': authenticated_userid(request),
        'is_admin': is_admin(request)
    }


@view_config(route_name='logout')
def logout(request):
    headers = forget(request)
    home = request.route_url('index')
    return HTTPFound(location=home, headers=headers)


@view_config(route_name='login', renderer='pyconca:templates/auth/login.mako')
@forbidden_view_config(
        renderer='pyconca:templates/auth/login.mako')
def login(request):
    login_url = request.route_url('login')
    referrer = request.url
    if referrer == login_url:
        referrer = '/' # never use the login form itself as came_from
    came_from = request.params.get('came_from', referrer)

    username = ''
    password = ''

    if 'login.submit' in request.params:
        username = request.params['username']
        password = request.params['password']
        user_dao = UserDao(None)
        user = user_dao.get_by_username(username)
        if user and check_password(password, user.password):
            headers = remember(request, user.id)
            return HTTPFound(location=came_from, headers=headers)
        request.session.flash('Login failed', 'error')

    response_ = _build_response(request)
    response_.update(
        came_from=came_from,
        username=username,
        password=password,
    )

    return response_

@view_config(route_name='forgot', renderer='pyconca:templates/auth/forgot.mako')
def forgot(request):
    username = ''

    if 'forgot.submit' in request.params:
        username = request.params['username']
        user_dao = UserDao(None)
        user = user_dao.get_by_username(username)
        if user:
            login = request.route_url('login')
            #msg = ('Instructions on how to reset your password have been'
            #       ' sent to your email address.')
            msg = ('Contact organizers@pycon.ca to reset your password.')
            request.session.flash(msg, 'error')
            return HTTPFound(location=login)
        msg = "Sorry. We couldn't find an account for that username."
        request.session.flash(msg, 'error')

    response_ = _build_response(request)
    response_.update(
        username=username,
    )

    return response_


@view_config(route_name='locale')
def language(request):
    locale_code = 'en'
    if get_locale_name(request) == 'en':
        locale_code = 'fr'
    return HTTPFound(location=request.referrer or '/',
        headers=locale_cookie_headers(locale_code))
