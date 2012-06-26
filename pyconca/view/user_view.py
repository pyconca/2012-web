from pyconca.view.base_view import BaseView


class UserView(BaseView):

    def _configure(self):
        self.name = 'user'
