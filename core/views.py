from django.utils.crypto import get_random_string
from django.shortcuts import render, redirect

def index(request):
    return render(request, 'index.html')

def create(request):
    court_id = get_random_string(length=4)
    return render(request, 'create.html', {'court_id': court_id})

def create_success(request):
    '''
    Called when game created
    '''
    data = request.POST
    court_id = data.get('court_id')
    return redirect('/court/' + court_id + '/')