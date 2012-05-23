from pyconca.dao.base_dao import BaseDao
from pyconca.models import User

class UserDao(BaseDao):

    def __init__(self):
        BaseDao.__init__(self, User)

    def get_by_username(self, username):
        return self._query().filter_by(username=username).first()
