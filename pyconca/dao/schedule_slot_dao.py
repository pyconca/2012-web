from pyconca.dao.base_dao import BaseDao
from pyconca.models import ScheduleSlot


class ScheduleSlotDao(BaseDao):

    def __init__(self, authenticated_user):
        BaseDao.__init__(self, authenticated_user, ScheduleSlot)

    def _default_order_by(self):
        return [self.model.start, self.model.room]

    def _query(self):
        query = BaseDao._query(self)
        return query
