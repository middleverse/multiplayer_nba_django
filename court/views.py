from django.utils.crypto import get_random_string
from django.shortcuts import render
from django.http import JsonResponse

from .forms import GameConfigForm
# VIEWS

def court(request, court_id, role):
    config_form = GameConfigForm
    return render(request, 'court.html', {
        'court_id': court_id,
        'role': role,
        'config_form': config_form,
    })   

def gameform(request):
    print(request.POST)
    return JsonResponse({'message':'working'}, status=201)