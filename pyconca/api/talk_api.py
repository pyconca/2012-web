from formencode import Schema
from formencode import validators

from pyramid.security import authenticated_userid
from pyramid.threadlocal import get_current_request
from pyramid.url import route_url

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

    def _create_flash(self, talk):
        msg = ('You have submitted a %s for PyCon Canada. Thank-you!' 
            % (talk.type))
        self.request.session.flash(msg, 'success')

    def _update_flash(self, talk):
        msg = ('Updated %s: %s' % (talk.type, talk.title))
        self.request.session.flash(msg, 'success')

    def _post_process_for_output(self, model, output):
        """
        Add some extra stuff for the videographer's use.
        Legend:
            / Have already
            - Can get, somehow
            X Not there at all

        fields that Carl wants:
        / name - title of talk
        X room - "room1" if there is only one room.
        X start - datetime in some parsable format
        X duration -- int minutes or "hh:mm:ss"
        X end - datetime in some parsable format
        - authors - list of people's names.
        - contact - list of email(s) of presenters.
        X released - permission to release.
        X license - CC license
        / description - used as the description of the video (paragraphs are fine)
        / conf_key - PK in source database - unique, used to update this item
        / conf_url - URL of talk page
        X tags - comma seperated list - serch terms, including sub topics briefly discussed in your talk.
        """
        request = get_current_request()
        new_output = output.copy()
        new_output.update({
            # Extra fields for Carl
            'name': output['title'],
            'description': output['abstract'],
            'conf_key': output['id'],
            'conf_url': route_url('talk_get', request, id=output['id']),
        })
        return new_output


class TalkSchema(Schema):
    title = validators.String(not_empty=True, strip=True)
    type = validators.String(not_empty=True, strip=True)
    level = validators.String(not_empty=True, strip=True)
    abstract = validators.String(not_empty=True, strip=True)
    outline = validators.String(not_empty=True, strip=True)
    reviewer_notes = validators.String(not_empty=True, strip=True)
