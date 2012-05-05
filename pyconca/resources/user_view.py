from pyconca.dao.user_dao import UserDao
from pyconca.resources.base_view import BaseView

class UserView(BaseView):

    def _configure(self):
        self.name = 'user'
        self.dao = UserDao()

    def _populate(self, user, is_create):
        user.first_name = self.request.params['first_name']
        user.last_name = self.request.params['last_name']
        user.username = self.request.params['username']
        user.email = self.request.params['email']
