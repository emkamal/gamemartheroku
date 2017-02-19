from gameapp.models import *
from django.conf import settings

def load_taxonomies(request):
    """Load taxonomies to be shown on the navbar"""
    game_categories = Taxonomy.objects.filter(taxonomy_type='game_category')
    game_tags = Taxonomy.objects.filter(taxonomy_type='game_tag')
    return {'game_categories': game_categories, 'game_tags': game_tags}

def load_state(request):
    """Load user authentication status."""
    userIsLoggedIn = False
    if request.user.is_authenticated():
        userIsLoggedIn = True

    return {
        'userIsLoggedIn': userIsLoggedIn
    }

# This is a workaround to solve Django's url reverse() function which is very slow when you have a lot of {% url %} on the template
def load_config(request):
    """Load BASE_URL constant to be accessible in the template for faster url rendering"""
    return {'BASE_URL': settings.BASE_URL}
