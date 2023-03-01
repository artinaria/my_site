from django import template
from blog.models import Post
from blog.models import Category

register = template.Library()
@register.inclusion_tag('website/latestpost.html') 
def latestpostswebsite(arg=6):
    posts=Post.objects.filter(status=1).order_by('published_date')[:arg]
    return{'posts':posts}