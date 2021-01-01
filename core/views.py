from django.utils.crypto import get_random_string
from django.shortcuts import render, redirect


def index(request):
    return render(request, 'index.html')

# TODO: REMOVE, NOT USED
def create(request):
    court_id = get_random_string(length=4)
    return render(request, 'court.html')

# TODO: REMOVE, NOT USED
def create_redirect(request):
    '''
    Called when game created
    '''
    data = request.POST
    court_id = get_random_string(length=4)
    shot_clock = data.get('shot_clock') or '24'
    divisions = data.get('divs') or 'ATLANTIC'
    buzzer_mode = data.get('buzz') or 'off'
    return redirect('/court/' + court_id + '/')
