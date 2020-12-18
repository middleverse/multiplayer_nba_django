from django.shortcuts import render, redirect

def index(request):
    return render(request, 'index.html')

def create(request):
    return render(request, 'create.html')

def create_success(request):
    response = redirect('court')
    return response