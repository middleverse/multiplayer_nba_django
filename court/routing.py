from django.urls import re_path

from . import consumers

websocket_urlpatterns = [
    re_path(r'ws/court/(?P<court_id>\w+)/$', consumers.CourtConsumer.as_asgi()) 
]