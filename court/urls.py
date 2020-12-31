from django.urls import path

from . import views

urlpatterns = [
    path('<str:court_id>/', views.court, name='court'), # lobby
]

