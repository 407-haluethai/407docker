from django.shortcuts import render
from .forms import UserRegistrationForm

def user_registration(request):
    form = UserRegistrationForm()
    return render(request, 'user_registration.html', {'form': form})
