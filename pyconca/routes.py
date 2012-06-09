def _setup_routes(config):
    config.add_route('index', '/')
    config.add_route('login', '/login')
    config.add_route('logout', '/logout')
    config.add_route('forgot', '/forgot')
    config.add_route('about', '/about')
    config.add_route('venue', '/venue')


def _add_resource(config, name):
    values = {'name': name}
    view = 'pyconca.resources.user_view.%sView' % (name.capitalize())
    template = 'pyconca:templates/%(name)s/%(name)s_' % (values)
    factory = 'pyconca.security.%sFactory' % (name.capitalize())

    #---------- routes

    config.add_route(
        name + '_index', '/%(name)s' % (values),
        factory=factory
    )

    config.add_route(
        name + '_create', '/new/%(name)s' % (values),
        factory=factory
    )

    config.add_route(
        name + '_get', '/%(name)s/{id}' % (values),
        factory=factory
    )

    config.add_route(
        name + '_delete', '/delete/%(name)s/{id}' % (values),
        factory=factory
    )

    config.add_route(
        name + '_update', '/edit/%(name)s/{id}' % (values),
        factory=factory
    )

    #---------- views

    route_name = name + '_index'
    config.add_view(view, attr='index',
        route_name=route_name,
        renderer=template + 'index.mako',
        permission=route_name
    )

    route_name = name + '_get'
    config.add_view(view, attr='get',
        route_name=route_name,
        renderer=template + 'get.mako',
        permission=route_name,
    )

    route_name = name + '_create'
    config.add_view(view, attr='create',
        route_name=route_name,
        renderer=template + 'edit.mako',
        permission=route_name,
    )

    route_name = name + '_update'
    config.add_view(view, attr='update',
        route_name=route_name,
        renderer=template + 'edit.mako',
        permission=route_name,
    )

    route_name = name + '_delete'
    config.add_view(view, attr='delete',
        route_name=route_name,
        permission=route_name,
    )
