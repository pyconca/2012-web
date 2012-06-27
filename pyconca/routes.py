def _setup_routes(config):
    config.add_route('index', '/')
    config.add_route('login', '/login')
    config.add_route('logout', '/logout')
    config.add_route('forgot', '/forgot')
    config.add_route('about', '/about')
    config.add_route('venue', '/venue')


def _add_api_resource(config, name):
    values = {'name': name}
    view = 'pyconca.api.%s_api.%sApi' % (name, name.capitalize())
    factory = 'pyconca.security.%sFactory' % (name.capitalize())

    route_name = 'api_%(name)s_index' % (values)
    config.add_route(
        route_name, '/%(name)s.json' % (values),
#        factory=factory
    )
    config.add_view(view, attr='index',
        route_name=route_name,
        renderer='json',
#        permission=route_name
    )

    route_name = 'api_%(name)s_get' % (values)
    config.add_route(
        route_name, '/%(name)s/{id}.json' % (values),
#        factory=factory
    )
    config.add_view(view, attr='get',
        route_name=route_name,
        renderer='json',
#        permission=route_name,
    )

    route_name = 'api_%(name)s_create' % (values)
    config.add_route(
        route_name, '/new/%(name)s.json' % (values),
#        factory=factory
    )
    config.add_view(view, attr='create',
        route_name=route_name,
        renderer='json',
#        permission=route_name,
    )

    route_name = 'api_%(name)s_update' % (values)
    config.add_route(
        route_name, '/edit/%(name)s/{id}.json' % (values),
#        factory=factory
    )
    config.add_view(view, attr='update',
        route_name=route_name,
        renderer='json',
#        permission=route_name,
    )

    route_name = 'api_%(name)s_delete' % (values)
    config.add_route(
        route_name, '/delete/%(name)s/{id}.json' % (values),
#        factory=factory
    )
    config.add_view(view, attr='delete',
        route_name=route_name,
        renderer='json',
#        permission=route_name,
    )


def _add_resource(config, name):
    values = {'name': name}
    view = 'pyconca.view.%s_view.%sView' % (name, name.capitalize())
    template = 'pyconca:templates/%(name)s/%(name)s_' % (values)
    factory = 'pyconca.security.%sFactory' % (name.capitalize())

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
        factory=factory
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
        factory=factory
    )
    config.add_view(view, attr='update',
        route_name=route_name,
        renderer=template + 'edit.mako',
        permission=route_name,
    )

