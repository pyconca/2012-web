import string


def camel_to_under(name):
    uppercase = string.ascii_uppercase
    parts = [c if c not in uppercase else '_' + c.lower() for c in name]
    return ''.join(parts).lstrip('_')
