from django.urls import path

from . import views

urlpatterns = [
    path('<str:court_id>/<str:role>/', views.court, name='court'), # lobby
    path('gameform/', views.gameform, name='gameform'),
    path('get_player_id/', views.get_player_id, name='get_player_id'),
]

