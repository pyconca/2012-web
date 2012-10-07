from pyramid.httpexceptions import HTTPFound
from pyramid.httpexceptions import HTTPNotFound
from pyramid.security import authenticated_userid
from pyramid.security import forget
from pyramid.security import remember
from pyramid.view import view_config
from pyramid.view import forbidden_view_config

from pyconca.dao.user_dao import UserDao
from pyconca.dao.activation_dao import ActivationDao
from pyconca.security import generate_password
from pyconca.security import check_password
from pyconca.security import is_admin
from pyconca.locale import locale_cookie_headers
from pyconca.messages import ReactivateMsg
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


@view_config(route_name='sponsors_500px', renderer='sponsors_500px.mako')
def sponsors_500px(request):
    return _build_response(request)


@view_config(route_name='contact', renderer='contact.mako')
def contact(request):
    return _build_response(request)


@view_config(route_name='conduct', renderer='conduct.mako')
def conduct(request):
    return _build_response(request)


@view_config(route_name='sprints', renderer='sprints.mako')
def sprints(request):
    return _build_response(request)


def _build_response(request):
    return {
        'logged_in': authenticated_userid(request),
        'is_admin': is_admin(request)
    }


def _build_response_with(request, **kwargs):
    response = _build_response(request)
    for k, v in kwargs.iteritems():
        response[k] = v
    return response


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
        referrer = '/'  # never use the login form itself as came_from
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


@view_config(route_name='forgot',
             renderer='pyconca:templates/auth/forgot.mako')
def forgot(request):
    email = None

    if 'forgot.submit' in request.params:
        email = request.params.get('email', '')
        user_dao = UserDao(None)
        user = user_dao.get_by_email(email)
        if user is None:
            msg = "Sorry. We couldn't find an account for that email."
            request.session.flash(msg, 'error')
            return _build_response_with(request, email=email)

        user.mark_pwd_reset("FORGOTTEN")
        settings = request.registry.settings
        msg = ReactivateMsg(user.email,
                            "Reset your PyCon.ca password",
                            settings)

        msg.send(request.route_url('pwd_reset_form', username=user.username,
                 reset_key=user.activation.code))

        login = request.route_url('login')
        msg = ('Instructions on how to reset your password have been'
               ' sent to your email address.')
        request.session.flash(msg, 'success')
        return HTTPFound(location=login)

    return _build_response_with(request, email=email)


@view_config(route_name='pwd_reset_form',
             renderer="pyconca:templates/auth/reset.mako")
def pwd_reset_form(request):
    """Allows for changing the password via valid activation key
    """
    rdict = request.matchdict

    username = rdict.get('username', None)
    activation_code = rdict.get('reset_key', None)

    #LOG.error("CHECKING")
    #LOG.error(username)

    # this can only be visited if user is visiting the reset with the right key
    # for the username in the url
    activation_dao = ActivationDao(None)
    if not activation_dao.check_valid(activation_code):
        # 404 if activation code has expired
        raise HTTPNotFound()

    user = activation_dao.get_user_by_code(username, activation_code)

    if user is None:
        # just 404 if we don't have an activation code for this user
        raise HTTPNotFound()

    #LOG.error(user.username)
    #LOG.error(user.email)
    return _build_response_with(request, user=user)


@view_config(route_name='pwd_reset',
             renderer="pyconca:templates/auth/reset.mako")
def pwd_reset(request):
    """Reset a user after being suspended

    :param username: required to know what user we're resetting
    :param activation: code needed to activate
    :param password: new password to use for the user

    """
    params = request.params

    username = params.get('username', None)
    activation_code = params.get('code', None)
    password1 = params.get('password1', None)
    password2 = params.get('password2', None)

    if password1 != password2:
        request.response.status_int = 500
        msg = ('The password you entered does not match')
        request.session.flash(msg, 'error')
        return _build_response(request)

    activation_dao = ActivationDao(None)
    res = activation_dao.set_new_pwd(username, activation_code,
                                     generate_password(password1))

    if res:
        # success so respond nicely
        #AuthLog.reactivate(username, success=True, code=activation)
        msg = ('Password has been successfully reset.')
        request.session.flash(msg, 'success')
        login = request.route_url('login')
        return HTTPFound(location=login)
    else:
        #AuthLog.reactivate(username, success=False, code=activation)
        request.response.status_int = 500
        msg = ('There was an issue attempting to activate this account.')
        request.session.flash(msg, 'error')
        return _build_response(request)


@view_config(route_name='pwd_change',
             renderer="pyconca:templates/auth/change.mako")
def pwd_change(request):
    """Reset a user after being suspended

    :param username: required to know what user we're resetting
    :param activation: code needed to activate
    :param password: new password to use for the user

    """
    params = request.params

    if 'change.submit' in params:
        current_password = params.get('current_password', None)
        password1 = params.get('password1', None)
        password2 = params.get('password2', None)

        if password1 != password2:
            request.response.status_int = 500
            msg = ('The password you entered does not match')
            request.session.flash(msg, 'error')
            return _build_response(request)

        user_dao = UserDao(None)
        user_id = authenticated_userid(request)
        if user_id is None:
            request.session.flash('Unidentified user', 'error')
            return _build_response(request)

        user = user_dao.get_by_id(user_id)
        if user and check_password(current_password, user.password):
            user_dao.set_new_pwd(user_id, generate_password(password1))
            request.session.flash('Password Successfully changed', 'success')
            return _build_response(request)
        request.session.flash('Incorrect password', 'error')

    return _build_response(request)


@view_config(route_name='locale')
def language(request):
    locale_code = 'en'
    if get_locale_name(request) == 'en':
        locale_code = 'fr'
    return HTTPFound(location=request.referrer or '/',
        headers=locale_cookie_headers(locale_code))
