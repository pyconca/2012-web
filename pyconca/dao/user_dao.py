from pyconca.dao.base_dao import BaseDao
from pyconca.models import User


class UserDao(BaseDao):

    def __init__(self, authenticated_user):
        BaseDao.__init__(self, authenticated_user, User)

    def get_by_username(self, username):
        return self._query().filter_by(username=username).first()

    def username_already_exists(self, username, id=None):
        query = self._query().filter_by(username=username)
        if id is not None:
            query = query.filter(self.model.id != id)
        return query.count() > 0
