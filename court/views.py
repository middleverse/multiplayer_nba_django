from django.shortcuts import render

# Create your views here.
def court(request):
    return render(request, 'court.html')