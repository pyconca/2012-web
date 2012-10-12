from pyconca.view.base_view import BaseView
from pyconca.security import get_user
from pyconca.dao.talk_dao import TalkDao


class TalkView(BaseView):

    def _configure(self):
        self.name = 'talk'
        self.body['is_talk_owner'] = self.is_talk_owner()

    def is_talk_owner(self):
        if self.id:
            talk_dao = TalkDao(self.request.user)
            return get_user(self.request) == talk_dao.get_owner(self.id)
        return None
