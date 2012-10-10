from pyramid.i18n import (
    get_locale_name, get_localizer, TranslationStringFactory)


def add_renderer_globals(event):
    request = event["request"]
    event['_'] = request.translate
    event['gettext'] = request.translate
    event['localizer'] = request.localizer

tsf = TranslationStringFactory('pyconca')


def add_localizer(event):
    request = event.request
    localizer = get_localizer(request)

    def auto_translate(string):
        return localizer.translate(tsf(string))

    request.localizer = localizer
    request.translate = auto_translate


def add_template_globals(event):
    event['enabled_locales'] = ("en", "fr",)
    event['locale_code'] = get_locale_name(event['request'])
