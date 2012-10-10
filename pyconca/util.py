import re
import string


def camel_to_under(name):
    uppercase = string.ascii_uppercase
    parts = [c if c not in uppercase else '_' + c.lower() for c in name]
    return ''.join(parts).lstrip('_')


def under_to_camel(name):
    return re.sub(
        r'(?:^|_)([a-zA-Z])',
        lambda matches: matches.group(1).upper(),
        name)
