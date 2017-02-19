"""
WSGI config for gamemart project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.10/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application


os.environ.setdefault("DJANGO_SETTINGS_MODULE", "gamemart.settings")

# application = get_wsgi_application()
if "DYNO" in os.environ:
    from dj_static import Cling
    from whitenoise.django import DjangoWhiteNoise
    application = Cling(get_wsgi_application())
    application = DjangoWhiteNoise(application)
else:
    application = get_wsgi_application()
