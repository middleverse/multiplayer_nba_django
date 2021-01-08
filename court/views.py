import json
from django.utils.crypto import get_random_string
from django.shortcuts import render
from django.http import JsonResponse

from .forms import GameConfigForm
from .models import Court

# VIEWS

def court(request, court_id, role):
    config_form = GameConfigForm
    return render(request, 'court.html', {
        'court_id': court_id,
        'role': role,
        'config_form': config_form,
    })   

def gameform(request):
    # TODO: validate form
    form_data = dict(request.POST)
    form = GameConfigForm(form_data)
    if form.is_valid():
        print('form valid')
        return JsonResponse({'message':'valid'}, status=201)
    else:
        print(form.errors)
        return JsonResponse({'message':'invalid'}, status=400)
    return JsonResponse({'message':'working'}, status=201)

def get_player_id(request):
    data = request.POST
    print(data)
    court_id = data.get('obtain-form-court-id')
    if Court.objects.filter(court_id=court_id).exists():
        court = Court.objects.get(court_id=court_id)
        generated_player_id = court.add_player()
        court.save()
        print('ID GP: ', generated_player_id, court_id)
        return JsonResponse({'message': {'player_id': generated_player_id}}, status=201)
    else:    
        return JsonResponse({'message': 'fooker'}, status=400)

def leave_court(request):
    form_data = dict(request.POST)
    court_id = form_data.get('court_id')[0]
    player_id = form_data.get('player_id')[0]
    player_role = form_data.get('player_role')[0]
    if Court.objects.filter(court_id=court_id).exists():
        court = Court.objects.get(court_id=court_id)
        court.remove_player(player_id)
        court.save()
    else:
        print('Court Id not found')
    return JsonResponse({'message': 'player left'}, status=202)