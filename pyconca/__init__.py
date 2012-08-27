from pyramid.authentication import AuthTktAuthenticationPolicy
from pyramid.authorization import ACLAuthorizationPolicy
from pyramid.config import Configurator
from pyramid.session import UnencryptedCookieSessionFactoryConfig
import pytz

from sqlalchemy import engine_from_config

from .models import DBSession
from .routes import _add_api_resource
from .routes import _add_resource
from .routes import _setup_routes
from .security import get_user
from .security import permission_finder

default_timezone = pytz.timezone('America/Toronto')

def main(global_config, **settings):
    global default_timezone

    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)

    if 'timezone' in settings:
        default_timezone = pytz.timezone(settings['timezone'])

    authn_policy = AuthTktAuthenticationPolicy(
        settings['secret.authn_policy'],
        callback=permission_finder)
    authz_policy = ACLAuthorizationPolicy()
    session_factory = UnencryptedCookieSessionFactoryConfig(
        settings['secret.unencrypted_cookie'])

    config = Configurator(settings=settings,
        root_factory='pyconca.security.RootFactory',
        session_factory=session_factory)
    config.set_authentication_policy(authn_policy)
    config.set_authorization_policy(authz_policy)
    config.set_request_property(get_user, 'user', reify=True)
    config.add_static_view('static', 'static', cache_max_age=3600)

    _setup_routes(config)
    _add_api_resource(config, 'user')
    _add_resource(config, 'user')
    _add_api_resource(config, 'talk')
    _add_resource(config, 'talk')

    config.scan()

    config.add_subscriber('pyconca.subscribers.add_localizer',
                          'pyramid.events.NewRequest')
    config.add_subscriber('pyconca.subscribers.add_renderer_globals',
                          'pyramid.events.BeforeRender')

    return config.make_wsgi_app()
