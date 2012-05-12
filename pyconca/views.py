from pyramid.view import view_config


@view_config(route_name='index', renderer='index.mako')
def index(request):
    return {}


@view_config(route_name='about', renderer='about.mako')
def about_us(request):
    return {}


@view_config(route_name='venue', renderer='venue.mako')
def venue(request):
    return {}
