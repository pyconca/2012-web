from pyconca.models import DBSession

class BaseDao(object):

    def __init__(self, model):
        self.model = model

    def get(self, id):
        return self._query().filter_by(id=id).first()

    def index(self):
        return self._query().all()

    def delete(self, instance):
        DBSession.delete(instance)

    def create(self):
        return self.model()

    def save(self, instance):
        DBSession.add(instance)
        DBSession.flush()

    def _query(self):
        return DBSession.query(self.model)
