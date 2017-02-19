import itertools

from django import forms
#from django.contrib.auth.models import User
from django.utils.text import slugify
from gameapp.models import User, Game, Taxonomy
from django.utils import timezone


class UserForm(forms.ModelForm):
    """Handle user registration form."""

    # Use password widget so password isn't shown
    password = forms.CharField(widget=forms.PasswordInput())

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'username', 'password', 'email', 'user_type')

    def save(self):
        instance = super(UserForm, self).save(commit=False)

        instance.slug = orig = '-'.join((slugify(instance.first_name), slugify(instance.last_name)))

        # If the slug already exist, append it with the next iterating number
        for x in itertools.count(1):
            if not User.objects.filter(slug=instance.slug).exists():
                break
            instance.slug = '%s-%d' % (orig, x)

        instance.save()

        return instance


class FirstNameForm(forms.Form):
    first_name = forms.CharField(max_length=30)

class LastNameForm(forms.Form):
    last_name = forms.CharField(max_length=30)

class EmailForm(forms.Form):
    email = forms.EmailField()

class BioForm(forms.Form):
    bio = forms.CharField(max_length=1000)

class SubmitForm(forms.ModelForm):
    """Handle game submission form."""

    class Meta:
        model = Game # Referencing the Game model and its fields
        fields = ['title', 'desc', 'instruction', 'url', 'price']

    # Additional fields
    categories = forms.ModelMultipleChoiceField(Taxonomy.objects.filter(taxonomy_type='game_category'))
    image = forms.FileField()

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(SubmitForm, self).__init__(*args, **kwargs)

    def save(self, request):
        instance = super(SubmitForm, self).save(commit=False)

        instance.owner_id = request.user.id
        instance.added_date = timezone.now()
        instance.slug = orig = slugify(instance.title)

        # If the slug already exist, append it with the next iterating number
        for x in itertools.count(1):
            if not Game.objects.filter(slug=instance.slug).exists():
                break
            instance.slug = '%s-%d' % (orig, x)

        instance.save()

        return instance
