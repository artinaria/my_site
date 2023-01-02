from django.shortcuts import render
from django.http import HttpResponse

def index_view(request):
    return HttpResponse('<h1> index_view </h1>')

def about_view(request):
    return HttpResponse('<h1> about_view </h1>')

def contact_view(request):
    return HttpResponse('<h1> contact_view </h1>')

