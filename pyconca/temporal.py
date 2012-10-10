import pytz


default_timezone = pytz.timezone('America/Toronto')


def local_isoformat(dt):
    dt_utc = dt.replace(tzinfo=pytz.UTC)
    dt_local = dt_utc.astimezone(default_timezone)
    return dt_local.isoformat()
