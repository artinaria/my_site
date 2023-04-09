from django import template
from blog.models import Post,comment
from blog.models import Category

register = template.Library()
@register.simple_tag(name='totalposts')
def function():
    postsnum=Post.objects.filter(status=1).count()
    return postsnum

@register.simple_tag(name='posts')
def function():
    posts=Post.objects.filter(status=1)
    return posts
@register.simple_tag(name='comments_count')
def function(pid):
    
    return comment.objects.filter(post=pid,approved=True).count()
    


@register.filter
def snippet(value,arg=20):
    return value[:arg]+'...'

@register.inclusion_tag('popularposts.html')    
def popularposts():
    posts=Post.objects.filter(status=1).order_by('published_date')
    return{'posts':posts}

@register.inclusion_tag('blog/blog-latestPosts.html') 
def latestposts(arg=3):
    posts=Post.objects.filter(status=1).order_by('published_date')[:arg]
    return{'posts':posts}

@register.inclusion_tag('blog/blog-post-category.html') 
def postcategory():
    posts=Post.objects.filter(status=1)
    categories=Category.objects.all()
    cat_dict={}
    for name in categories:
        cat_dict[name]=posts.filter(category=name).count()
    return{'categories':cat_dict}




