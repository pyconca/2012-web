from pyconca.util import under_to_camel


def _setup_routes(config):
    config.add_route('index', '/')
    config.add_route('login', '/login')
    config.add_route('forgot', '/forgot')
    config.add_route('pwd_reset_form', '/reset/{username}/{reset_key}')
    config.add_route('pwd_reset', '/reset', request_method="POST")
    config.add_route('pwd_change', "/change")
    config.add_route('logout', '/logout')
    config.add_route('about', '/about')
    config.add_route('locale', '/locale')
    config.add_route('conduct', '/conduct')
    config.add_route('contact', '/contact')
    config.add_route('learn', '/learn')
    config.add_route('venue', '/venue')
    config.add_route('schedule', '/schedule')
    config.add_route('speakers', '/speakers')
    config.add_route('sponsors', '/sponsors')
#    config.add_route('sponsors_500px', '/sponsors/500px')
    config.add_route('sprints', '/sprints')


def _add_api_resource(config, name):
    values = {'name': name}
    view = 'pyconca.api.%s_api.%sApi' % (name, under_to_camel(name))
    factory = 'pyconca.security.%sFactory' % (under_to_camel(name))

    route_name = 'api_%(name)s_index' % (values)
    config.add_route(
        route_name, '/%(name)s.json' % (values),
        factory=factory
    )
    config.add_view(view, attr='index',
        route_name=route_name,
        renderer='json',
        permission=route_name
    )

    route_name = 'api_%(name)s_get' % (values)
    config.add_route(
        route_name, '/%(name)s/{id}.json' % (values),
        factory=factory,
        traverse='/{id}'
    )
    config.add_view(view, attr='get',
        route_name=route_name,
        renderer='json',
        permission=route_name,
    )

    route_name = 'api_%(name)s_create' % (values)
    config.add_route(
        route_name, '/new/%(name)s.json' % (values),
        factory=factory
    )
    config.add_view(view, attr='create',
        route_name=route_name,
        renderer='json',
        request_method='POST',
        permission=route_name,
    )

    route_name = 'api_%(name)s_update' % (values)
    config.add_route(
        route_name, '/edit/%(name)s/{id}.json' % (values),
        factory=factory,
        traverse='/{id}'
    )
    config.add_view(view, attr='update',
        route_name=route_name,
        renderer='json',
        request_method='POST',
        permission=route_name,
    )

    route_name = 'api_%(name)s_delete' % (values)
    config.add_route(
        route_name, '/delete/%(name)s/{id}.json' % (values),
        factory=factory,
        traverse='/{id}'
    )
    config.add_view(view, attr='delete',
        route_name=route_name,
        renderer='json',
        request_method='POST',
        permission=route_name,
    )


def _add_resource(config, name):
    values = {'name': name}
    view = 'pyconca.view.%s_view.%sView' % (name, under_to_camel(name))
    template = 'pyconca:templates/%(name)s/%(name)s_' % (values)
    factory = 'pyconca.security.%sFactory' % (under_to_camel(name))

    route_name = name + '_index'
    config.add_route(
        route_name, '/%(name)s' % (values),
        factory=factory
    )
    config.add_view(view, attr='index',
        route_name=route_name,
        renderer=template + 'index.mako',
        permission=route_name
    )

    route_name = name + '_get'
    config.add_route(
        route_name, '/%(name)s/{id}' % (values),
        factory=factory,
        traverse='/{id}'
    )
    config.add_view(view, attr='get',
        route_name=route_name,
        renderer=template + 'get.mako',
        permission=route_name,
    )

    route_name = name + '_create'
    config.add_route(
        route_name, '/new/%(name)s' % (values),
        factory=factory
    )
    config.add_view(view, attr='create',
        route_name=route_name,
        renderer=template + 'edit.mako',
        permission=route_name,
    )

    route_name = name + '_update'
    config.add_route(
        route_name, '/edit/%(name)s/{id}' % (values),
        factory=factory,
        traverse='/{id}'
    )
    config.add_view(view, attr='update',
        route_name=route_name,
        renderer=template + 'edit.mako',
        permission=route_name,
    )
