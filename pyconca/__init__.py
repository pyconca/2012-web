from pyramid.config import Configurator
from sqlalchemy import engine_from_config

from .models import DBSession

def _add_resource(config, name):
    values = {'name': name}
    view = 'pyconca.resources.user_view.%sView' % (name.capitalize())
    template = 'pyconca:templates/%(name)s/%(name)s_' % (values)

    config.add_route(name + '_index', '/%(name)s' % (values))
    config.add_route(name + '_create', '/new/%(name)s' % (values))
    config.add_route(name + '_get', '/%(name)s/{id}' % (values))
    config.add_route(name + '_delete', '/delete/%(name)s/{id}' % (values))
    config.add_route(name + '_update', '/edit/%(name)s/{id}' % (values))

    config.add_view(
        view,
        attr='index',
        route_name=name + '_index',
        renderer=template + 'index.pt')
    config.add_view(
        view,
        attr='get',
        route_name=name + '_get',
        renderer=template + 'get.pt')
    config.add_view(
        view,
        attr='create',
        route_name=name + '_create',
        renderer=template + 'edit.pt')
    config.add_view(
        view,
        attr='update',
        route_name=name + '_update',
        renderer=template + 'edit.pt')
    config.add_view(
        view,
        attr='delete',
        route_name=name + '_delete')

def main(global_config, **settings):
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)
    config = Configurator(settings=settings)
    config.add_static_view('static', 'static', cache_max_age=3600)

    config.add_route('index', '/')
    config.add_route('about', '/about')
    config.add_route('venue', '/venue')

    _add_resource(config, 'user')

    config.scan()
    return config.make_wsgi_app()

