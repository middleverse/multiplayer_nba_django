from django.utils.crypto import get_random_string
from django.shortcuts import render, redirect


def index(request):
    return render(request, 'index.html')

def create_redirect(request):
    '''
    Redirects to Court Creation.
    '''
    court_id = get_random_string(length=4)
    return redirect('/court/' + court_id + '/')
