from pyramid.security import Allow
from pyramid.security import Everyone


USERS = {
    'editor':'editor',
    'viewer':'viewer'
}
GROUPS = {'editor':['group:editors']}


def group_finder(userid, request):
    if userid in USERS:
        return GROUPS.get(userid, [])


class RootFactory(object):
    __acl__ = [
        (Allow, Everyone, 'view'),
        (Allow, 'group:editors', 'edit')
    ]

    def __init__(self, request):
        pass
