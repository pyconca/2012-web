from formencode import Schema
from formencode import validators

from pyramid.security import authenticated_userid

from pyconca.api.base_api import BaseApi
from pyconca.dao.talk_dao import TalkDao


class TalkApi(BaseApi):

    def _configure(self):
        self.name = 'talk'
        self.dao = TalkDao()
        self.schema = TalkSchema

    def _populate(self, talk, form):
        talk.owner_id = authenticated_userid(self.request)
        talk.title = form['title']
        talk.type = form['type']
        talk.level = form['level']
        talk.abstract = form['abstract']
        talk.outline = form['outline']
        talk.reviewer_notes = form['reviewer_notes']


class TalkSchema(Schema):
    title = validators.String(not_empty=True, strip=True)
    type = validators.String(not_empty=True, strip=True)
    level = validators.String(not_empty=True, strip=True)
    abstract = validators.String(not_empty=True, strip=True)
    outline = validators.String(not_empty=True, strip=True)
    reviewer_notes = validators.String(not_empty=True, strip=True)
