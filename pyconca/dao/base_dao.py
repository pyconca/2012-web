from pyconca.models import DBSession

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
        except:
            # TODO
            return None

    def index(self):
        try:
            return self._query().all()
        except:
            # TODO
            return []

    def delete(self, instance):
        DBSession.delete(instance)

    def create(self):
        return self.model()

    def save(self, instance):
        DBSession.add(instance)
        DBSession.flush()

    def _query(self):
        return DBSession.query(self.model)
