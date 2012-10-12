from pyconca.dao.base_dao import BaseDao
from pyconca.models import Talk

from sqlalchemy import or_


class TalkDao(BaseDao):
    def __init__(self, authenticated_user):
        BaseDao.__init__(self, authenticated_user, Talk)

    def _default_order_by(self):
        return [self.model.title]

    def _query(self):
        query = BaseDao._query(self)
        if self.is_admin:
            return query
        if self.authenticated_user:
            return query.filter(or_(
                (Talk.schedule_slot != None),
                (Talk.owner_id == self.authenticated_user.id)
            ))
        return query.filter(Talk.schedule_slot != None)

    def get_owner(self, talk_id):
        talk = self._query().filter_by(id=talk_id).first()
        return talk.owner
