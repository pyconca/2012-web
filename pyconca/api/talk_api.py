from formencode import Invalid
from formencode import Schema
from formencode import validators

from pyramid.security import authenticated_userid
from pyramid.threadlocal import get_current_request
from pyramid.url import route_url

from pyconca.api.base_api import BaseApi
from pyconca.dao.schedule_slot_dao import Schedule_slotDao
from pyconca.dao.talk_dao import TalkDao
from pyconca.temporal import local_isoformat


class TalkApi(BaseApi):

    def _configure(self):
        self.name = 'talk'
        self.dao = TalkDao(self.request.user)
        self.schedule_slot_dao = Schedule_slotDao(self.request.user)
        self.schema = TalkSchema

    def _populate(self, talk, form, is_create):
        if self.is_admin:
            talk.owner_id = form['owner_id']
        else:
            if is_create:
                talk.owner_id = authenticated_userid(self.request)
        if self.is_admin:
            talk.reviewer_notes = form['reviewer_notes']
        if self.is_admin and 'schedule_slot_id' in form:
            if form['schedule_slot_id'] == -1:
                # -1 in the form means "not scheduled"
                talk.schedule_slot = None
            elif form['schedule_slot_id'] > 0:
                talk.schedule_slot = self.schedule_slot_dao.get(
                    form['schedule_slot_id'])
            else:
                # It's equal to zero,
                # therefore "not specified",
                # so don't do anything.
                pass
        talk.title = form['title']
        talk.type = form['type']
        talk.level = form['level']
        talk.abstract = form['abstract']
        talk.outline = form['outline']

    def _validate(self, model, form):
        super(TalkApi, self)._validate(model, form)
        if int(form.get('schedule_slot_id', 0)) > 0:
            schedule_slot = self.schedule_slot_dao.get(
                form['schedule_slot_id'])
            if schedule_slot.talk and schedule_slot.talk is not model:
                exc = Invalid(
                    "Schedule slot is already in use", 'schedule_slot_id',
                    None)
                exc.error_dict = {'schedule_slot_id': exc}
                raise exc

    def _create_flash(self, talk):
        msg = ('You have submitted a talk for PyCon Canada. Thank-you!')
        self.request.session.flash(msg, 'success')

    def _update_flash(self, talk):
        msg = ('Updated talk')
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
            'schedule_slot_id': None,
            'room': None,
            'start': None,
            'end': None,
            'duration': None,
        }
        if model.schedule_slot:
            assert model.schedule_slot.start < model.schedule_slot.end
            end = model.schedule_slot.end
            start = model.schedule_slot.start
            duration_delta = end - start
            assert duration_delta.days == 0
            schedule.update({
                'schedule_slot_id': model.schedule_slot.id,
                'room': model.schedule_slot.room,
                'start': local_isoformat(model.schedule_slot.start),
                'end': local_isoformat(model.schedule_slot.end),
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
    schedule_slot_id = validators.Int(not_empty=False, if_missing=0)
    owner_id = validators.Int(not_empty=True)
