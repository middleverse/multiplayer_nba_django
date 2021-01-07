from django.utils.crypto import get_random_string
from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.core.exceptions import ValidationError


from .forms import CourtIdForm
from court.models import Court

def index(request):
    return render(request, 'index.html')

def create_redirect(request):
    '''
    Redirects to Court 
    '''
    court_id = None
    while True:
        court_id = get_random_string(length=4)
        # TODO: Is there a better way to do this validation?
        if Court.objects.filter(court_id=court_id).exists() is False:
            break

    Court.objects.create(court_id=court_id)    

    role = 'captain'
    return redirect('/court/' 
        + court_id 
        + '/'
        + role
        + '/'
        )

def join_redirect(request):
    '''
    Redirects to Court 
    '''
    role = 'player'
    form = CourtIdForm(request.POST)

    if form.is_valid():
        court_id = form.cleaned_data['court_id']
        if Court.objects.filter(court_id=court_id).exists() is False:
            return JsonResponse({'message': 'Invalid id.'}, status=400)
        else:
            print('# OF PLAYERS: ',Court.objects.get(court_id=court_id).get_current_player_list())
            if len(Court.objects.get(court_id=court_id).get_current_player_list()) > 3:
                return JsonResponse({'message': 'Capacity full.'}, status=400)

        return JsonResponse({'message': {
                                'role': 'player', 
                                'court_id': court_id
                            }}, 
                            status=201)

    
    
    
