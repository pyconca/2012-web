from pyconca.api.base_api import BaseApi
from pyconca.dao.schedule_slot_dao import Schedule_slotDao

class Schedule_slotApi(BaseApi):

    def _configure(self):
        self.name = 'schedule_slot'
        self.dao = Schedule_slotDao(self.request.user)
        self.schema = None#ScheduleSlotSchema
