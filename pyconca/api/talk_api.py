from formencode import Schema
from formencode import validators

from pyramid.security import authenticated_userid
from pyramid.threadlocal import get_current_request
from pyramid.url import route_url

import pytz

from pyconca import default_timezone
from pyconca.api.base_api import BaseApi
from pyconca.dao.talk_dao import TalkDao

class TalkApi(BaseApi):

    def _configure(self):
        self.name = 'talk'
        self.dao = TalkDao(self.request.user)
        self.schema = TalkSchema

    def _populate(self, talk, form, is_create):
        if self.is_admin:
            talk.owner_id = form['owner_id']
        else:
            if is_create:
                talk.owner_id = authenticated_userid(self.request)
        if self.is_admin:
            talk.reviewer_notes = form['reviewer_notes']
        talk.title = form['title']
        talk.type = form['type']
        talk.level = form['level']
        talk.abstract = form['abstract']
        talk.outline = form['outline']

    def _create_flash(self, talk):
        msg = ('You have submitted a talk for PyCon Canada. Thank-you!')
        self.request.session.flash(msg, 'success')

    def _update_flash(self, talk):
        msg = ('Updated talk')
        self.request.session.flash(msg, 'success')

    def _local_isoformat(self, dt):
        dt_utc = dt.replace(tzinfo=pytz.UTC)
        dt_local = dt_utc.astimezone(default_timezone)
        return dt_local.isoformat()

    def _post_process_for_output(self, model, output):
        """
        Add some extra stuff for the videographer's use.
        Legend:
            / Have already
            - Can get, somehow
            X Not there at all

        fields that Carl wants:
        / name - title of talk
        / room - "room1" if there is only one room.
        / start - datetime in some parsable format
        / duration -- int minutes or "hh:mm:ss"
        / end - datetime in some parsable format
        - authors - list of people's names.
        - contact - list of email(s) of presenters.
        X released - permission to release.
        X license - CC license
        / description - used as the description of the video
          (paragraphs are fine)
        / conf_key - PK in source database - unique, used to update this item
        / conf_url - URL of talk page
        X tags - comma separated list - search terms, including sub topics
          briefly discussed in your talk.
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
        schedule = {
            'room': None,
            'start': None,
            'end': None,
            'duration': None,
        }
        if model.schedule_slot:
            assert model.schedule_slot.start < model.schedule_slot.end
            duration_delta = model.schedule_slot.end - model.schedule_slot.start
            assert duration_delta.days == 0
            schedule.update({
                'room': model.schedule_slot.room,
                'start': self._local_isoformat(model.schedule_slot.start),
                'end': self._local_isoformat(model.schedule_slot.end),
                'duration': duration_delta.seconds / 60,
            })
        new_output.update(schedule)
        return new_output


class TalkSchema(Schema):
    title = validators.String(not_empty=True, strip=True)
    type = validators.String(not_empty=True, strip=True)
    level = validators.String(not_empty=True, strip=True)
    abstract = validators.String(not_empty=True, strip=True)
    outline = validators.String(not_empty=True, strip=True)
    reviewer_notes = validators.String(
        not_empty=False, strip=True, if_missing='')
    owner_id = validators.Int(not_empty=True)
