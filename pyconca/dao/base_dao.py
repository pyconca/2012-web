import logging

from pyconca.models import DBSession


log = logging.getLogger(__name__)


class BaseDao(object):

    def __init__(self, authenticated_user, model):
        self.authenticated_user = authenticated_user
        self.model = model

    @property
    def is_admin(self):
        return self.authenticated_user and self.authenticated_user.is_admin

    def get(self, id):
        try:
            return self._query().filter_by(id=id).first()
        except Exception as e:
            log.exception("Failed to get first()")
            # TODO
            return None

    def index(self):
        try:
            return self._query().all()
        except Exception as e:
            log.exception("Failed to get all()")
            # TODO
            return []

    def delete(self, instance):
        DBSession.delete(instance)

    def create(self):
        return self.model()

    def save(self, instance):
        DBSession.add(instance)
        DBSession.flush()

    def _default_order_by(self):
        return None

    def _query(self):
        query = DBSession.query(self.model)
        default_order_by = self._default_order_by()
        if default_order_by:
            query = query.order_by(*default_order_by)
        return query
