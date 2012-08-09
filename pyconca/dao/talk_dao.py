from pyconca.dao.base_dao import BaseDao
from pyconca.models import Talk


class TalkDao(BaseDao):

    def __init__(self):
        BaseDao.__init__(self, Talk)
