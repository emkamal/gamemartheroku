"""
Django settings for gamemart project.

Generated by 'django-admin startproject' using Django 1.10.5.

For more information on this file, see
https://docs.djangoproject.com/en/1.10/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.10/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

"""added 22.1.2017 - for authentication"""
AUTH_USER_MODEL = 'gameapp.User'
SOCIAL_AUTH_USER_MODEL = 'gameapp.User'

SOCIAL_AUTH_SLUGIFY_USERNAMES = False

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '4)unxp6%j1i)z!o2im2)=3r#nkf+rc4$r#w&4@cahc24k%l7if'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ["192.168.5.5", "127.0.0.1", "localhost"]


# Application definition

INSTALLED_APPS = [
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.admin',
    #'social.apps.django_app.default',
    # 'social_django',
    'gameapp',
    #'social.apps.django_app.default',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    #'social.apps.django_app.middleware.SocialAuthExceptionMiddleware',
    'social_django.middleware.SocialAuthExceptionMiddleware',
]

ROOT_URLCONF = 'gamemart.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['gameapp/templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                #'social.apps.django_app.context_processors.backends',
                #'social.apps.django_app.context_processors.login_redirect',
                'social_django.context_processors.backends',
                'social_django.context_processors.login_redirect',
            ],
        },
    },
]
TEMPLATES[0]['OPTIONS']['context_processors'].append("gameapp.context_processors.load_taxonomies")
TEMPLATES[0]['OPTIONS']['context_processors'].append("gameapp.context_processors.load_config")
TEMPLATES[0]['OPTIONS']['context_processors'].append("gameapp.context_processors.load_state")

WSGI_APPLICATION = 'gamemart.wsgi.application'

AUTHENTICATION_BACKENDS = (
    #'social.backends.github.GithubOAuth2',
    #'social.backends.twitter.TwitterOAuth',
    #'social.backends.facebook.FacebookOAuth2',
    'social_core.backends.github.GithubOAuth2',
    'social_core.backends.twitter.TwitterOAuth',
    'social_core.backends.facebook.FacebookOAuth2',
    'django.contrib.auth.backends.ModelBackend',
)

#this maybe to separate configuration from settings
SOCIAL_AUTH_GITHUB_KEY = 'a1e04b93197074ce03d5'
SOCIAL_AUTH_GITHUB_SECRET = '0864e23c966bdb4f2900afb55973bb1cf5e5066a'

SOCIAL_AUTH_TWITTER_KEY = '43kYp5l6SEAjemQcMzJGggpoD'
SOCIAL_AUTH_TWITTER_SECRET = 'BMPvxkZEAj9OWcorPgpEu4sIAoy6XW5cXjL7kWizv1dypQBTX7'

SOCIAL_AUTH_FACEBOOK_KEY = '1780843878880223'  # App ID
SOCIAL_AUTH_FACEBOOK_SECRET = '192eb87fedfd2441a75a2dedc8de5a26'


SOCIAL_AUTH_PIPELINE = (
    'social.pipeline.social_auth.social_details',
    'social.pipeline.social_auth.social_uid',
    'social.pipeline.social_auth.auth_allowed',
    'social.pipeline.social_auth.social_user',
    'social.pipeline.user.get_username',
    'social.pipeline.user.create_user',

    'gameapp.pipelines.create_slug',

    'social.pipeline.social_auth.associate_user',
    'social.pipeline.social_auth.load_extra_data',
    'social.pipeline.user.user_details',
)



# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'gamemart',
        'USER': 'gamemartdbadmin',
        'PASSWORD': 'snowisdeliciouswithsyrup',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}


# Password validation
# https://docs.djangoproject.com/en/1.10/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.10/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.10/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static/')

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media/')

BASE_URL = 'http://gamemart.herokuapp.com'
PAYMENT_SECRET_KEY = '3195b7c7a372b31e6b1eaa8242f8dcfb';
SELLER_ID = 'GameMartInc'


LOGIN_URL = 'login'
LOGOUT_URL = 'logout'
LOGIN_REDIRECT_URL = 'home_page'


# Only when running in Heroku
if "DYNO" in os.environ:
    # STATIC_ROOT = 'staticfiles'
    PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))
    STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static')
    STATIC_URL = '/static/'

    import dj_database_url
    DATABASES['default'] =  dj_database_url.config()

    DEBUG = True # False, once service is succesfully deployed
    ALLOWED_HOSTS = ['*']
