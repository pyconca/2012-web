from pyconca.view.base_view import BaseView


class TalkView(BaseView):

    def _configure(self):
        self.name = 'talk'
        self.body['is_talk_owner'] = self.is_talk_owner
