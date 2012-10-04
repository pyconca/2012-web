from pyconca.dao.base_dao import BaseDao
from pyconca.models import User


class UserDao(BaseDao):

    def __init__(self, authenticated_user):
        BaseDao.__init__(self, authenticated_user, User)

    def _default_order_by(self):
        return [self.model.last_name, self.model.first_name, self.model.id]

    def get_by_username(self, username):
        return self._query().filter_by(username=username).first()

    def get_by_id(self, id):
        return self._query().filter_by(id=id).first()

    def get_by_email(self, email):
        return self._query().filter_by(email=email).first()

    def set_new_pwd(self, id, new_pwd):
        user = self._query().filter_by(id=id).first()

        if user is not None:
            user.password = new_pwd
            return True
        else:
            return False

    def username_already_exists(self, username, id=None):
        query = self._query().filter_by(username=username)
        if id is not None:
            query = query.filter(self.model.id != id)
        return query.count() > 0
