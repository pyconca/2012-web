from pyramid.i18n import default_locale_negotiator


def locale_cookie_headers(locale_code):
    '''Returns HTTP headers setting the cookie that sets the Pyramid locale.'''
    return [(b'Set-Cookie',
        b'_LOCALE_={0}; expires=Fri, 31-Dec-9999 23:00:00 GMT; Path=/' \
        .format(locale_code.encode('utf8')))]


def locale_from_browser(request):
    return request.accept_language.best_match(("fr","en"))


def locale_negotiator(request):
    '''This is a locale negotiator that decorates Pyramid's default one.

    If the default locale negotiator's schemes should fail,
    we try to match the browser's stated preferred languages
    with our configured enabled locales.
    '''
    return default_locale_negotiator(request) or locale_from_browser(request)
