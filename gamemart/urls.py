"""Gamemart URL Configuration"""
from django.conf.urls import url, include
from django.conf.urls.static import static
from django.conf import settings
from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.contrib.auth.views import logout_then_login
from gameapp import views

urlpatterns = [
    url(r'^$', views.home, name='home_page'),

    # Authentication related urls
    url(r'^login/$', auth_views.login, name='login'),
    url(r'^logout/$', lambda request: logout_then_login(request, "/"), name='logout'),
    url(r'^password_reset/$', auth_views.password_reset, name='password_reset'),
    url(r'^password_reset/done/$', auth_views.password_reset_done, name='password_reset_done'),
    url(r'^reset/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$', auth_views.password_reset_confirm, name='password_reset_confirm'),
    url(r'^reset/done/$', auth_views.password_reset_complete, name='password_reset_complete'),

    # Registration related urls
    url(r'^register/$', views.register, name='register'),
    # url(r'^oauth/', include('social_django.urls', namespace='social')), # TODO: fix issue on production server

    # User dashboard related urls
    url(r'^accounts/profile/$', views.home),
    url(r'^account/dashboard/$', views.dashboard, name='user_dashboard'),
    url(r'^account/editProfile/$', views.editProfile, name='editProfile'),
    url(r'^changeFirstName/$', views.changeFirstName),
    url(r'^changeLastName/$', views.changeLastName),
    url(r'^changeEmail/$', views.changeEmail),
    url(r'^changeBio/$', views.changeBio),

    # Games related urls
    url(r'^games/$', views.browse, name='browse'),
    url(r'^games/(?P<type>[-\w]+)/$', views.explore, name='explore'),
    url(r'^games/category/(?P<tag>[-\w]+)/$', views.explore_by_taxonomy, name='browse_by_category'),
    url(r'^games/tag/(?P<tag>[-\w]+)/$', views.explore_by_taxonomy, name='browse_by_tag'), # TODO: implement tag field on submit form
    url(r'^search/$', views.search, name='search'),
    url(r'^game/(?P<slug>[-\w]+)/$', views.game_by_slug, name='game'),
    url(r'^payment/(?P<status>[-\w]+)/on/(?P<slug>[-\w]+)/$', views.payment, name='pay'),

    # Developer related urls
    url(r'^developer/$', views.developer, name='developer'),
    url(r'^submit/$', views.submit, name='submit'),
    url(r'^api/(?P<target>[-\w]+)/$', views.api),
    url(r'^user/(?P<slug>[-\w]+)/$', views.game_by_slug, name='user_view'),
    url(r'^game/edit/([0-9]+)/$', views.edit_game, name='edit_game'),
    url(r'^game/delete/([0-9]+)/$', views.del_game, name='del_game'),

    url(r'^admin/', admin.site.urls),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

urlpatterns += patterns('',
    (r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT}),
)
