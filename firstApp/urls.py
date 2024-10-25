from django.urls import path
from . import views

urlpatterns = [
    path('userRegistration/', views.user_registration, name='user_registration'),
]
