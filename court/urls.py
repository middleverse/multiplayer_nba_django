from django.urls import path

from . import views

urlpatterns = [
    path('<str:court_id>/<str:role>/', views.court, name='court'), # lobby
    path('gameform/', views.gameform, name='gameform')
]

