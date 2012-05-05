from pyramid.renderers import get_renderer
from pyramid.response import Response
from pyramid.view import view_config

def site_layout():
    renderer = get_renderer("templates/layout.pt")
    layout = renderer.implementation().macros['layout']
    return layout

@view_config(route_name='index', renderer='templates/index.pt')
def index(request):
    return {'layout': site_layout()}

@view_config(route_name='about', renderer='templates/about.pt')
def about_us(request):
    return {'layout': site_layout()}
