from pyconca.dao.base_dao import BaseDao
from pyconca.models import Talk


class TalkDao(BaseDao):

    def __init__(self, authenticated_user):
        BaseDao.__init__(self, authenticated_user, Talk)

    def get_by_owner(self, owner):
        return owner.talks
