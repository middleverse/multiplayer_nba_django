from django.shortcuts import render

# Create your views here.
def court(request, court_id):
     return render(request, 'court.html', {
        'court_id': court_id
    })   

def lobby(request, court_id):
    return render(request, 'lobby.html', {
        'court_id': court_id
    })

def game(request, court_id):
    return render(request, 'game.html')
