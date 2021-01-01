from django.utils.crypto import get_random_string
from django.shortcuts import render

# VIEWS

def court(request, court_id):
    return render(request, 'court.html', {
        'court_id': court_id
    })   