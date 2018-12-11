from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^$',index_views),
    url(r'^query/$',query_views),
    url(r'^login/$',login_views),
    url(r'^register/$',register_views),
    url(r'^check_login/$',check_login_views),
    url(r'^logout/$',logout_views),
    url(r'^release/$',release_views),
]