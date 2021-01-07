import json
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
    print('REQUEST IN GAMEFORM:', request.POST)
    # TODO: validate form
    form_data = dict(request.POST)
    print('FORMDATA: ', form_data)
    form = GameConfigForm(form_data)
    # form.division = 
    # form.shot_clock = 
    # print(form.is_bound)
    # print(form.val) 
    if form.is_valid():
        print('form valid')
        return JsonResponse({'message':'valid'}, status=201)
    else:
        print(form.errors)
        return JsonResponse({'message':'invalid'}, status=400)
    return JsonResponse({'message':'working'}, status=201)

def player_information(request):
    pass