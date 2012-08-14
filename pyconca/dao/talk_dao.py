from pyconca.dao.base_dao import BaseDao
from pyconca.models import Talk


class TalkDao(BaseDao):

    def __init__(self, authenticated_user):
        BaseDao.__init__(self, authenticated_user, Talk)

    def _query(self):
        query = BaseDao._query(self)
        if self.is_admin:
            return query
        elif self.authenticated_user:
            return query.filter_by(owner_id=self.authenticated_user.id)
        else:
            raise Exception # TODO
