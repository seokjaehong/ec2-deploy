from .base import *

secrets = json.loads(open(SECRETS_PRODUCTIONS, 'rt').read())

DEBUG = False
ALLOWED_HOSTS = [
    '.amazonaws.com',
]
DATABASES = secrets['DATABASES']
