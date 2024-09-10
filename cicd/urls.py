from django.contrib import admin
from django.urls import path
from cicd import views

urlpatterns = [
    path('hey/', views.home ,name = 'welcome'),
]