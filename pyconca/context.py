from pyconca.security import is_admin


class Context(object):

    def __init__(self, request):
        self.request = request

    @property
    def id(self):
        if 'id' in self.request.matchdict:
            return self.request.matchdict['id']

    @property
    def is_admin(self):
        return is_admin(self.request)
