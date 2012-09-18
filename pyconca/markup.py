class ContainsIntentionalMarkup(object):
    def __init__(self, s):
        self.s = s
    def __html__(self):
        return self.s
