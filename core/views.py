from django.utils.crypto import get_random_string
from django.shortcuts import render, redirect

from .forms import CourtIdForm


def index(request):
    return render(request, 'index.html')

def create_redirect(request):
    '''
    Redirects to Court Creation.
    '''
    court_id = get_random_string(length=4)
    return redirect('/court/' + court_id + '/')

def join_redirect(request):
    '''
    Redirects to Court Lobby
    '''
    form = CourtIdForm(request.POST)
    print('FORM DETAILS:', form)
    if(form.is_valid):
        court_id = form.cleaned_data['court_id']
        return redirect('/court/' + court_id + '/')