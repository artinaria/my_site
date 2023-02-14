from django.shortcuts import render,get_object_or_404
from blog.models import Post
from django.utils import timezone
from django.db.models import Max, Min



def blog_view(request,**kwargs):
    posts= Post.objects.filter(status=1,published_date__lte=timezone.now())
    if kwargs.get('cat_name'):
        posts=Post.objects.filter(category__name=kwargs['cat_name'])
    if kwargs.get('author_username'):
        posts=Post.objects.filter(author__username=kwargs['author_username'])
    
    

    #posts=Post.objects.filter(status=1)
    #posts=Post.objects.filter
    #posts=Post.objects.all()
    context={'posts':posts}
    return render(request,'blog/blog-home.html',context)

# def blog_single(request,pid):
#     post=get_object_or_404(Post,pk=pid, status=1)
#     post.content_view = post.content_view + 1
#     post.save()
#     context={'post':post}
#     return render(request,'blog/blog-single.html',context)

def get_prev_id(curr_id):
    try:
        ret = Post.objects.filter(id__lt=curr_id).order_by("-id")[0:1].get().id
    except Post.DoesNotExist:
        ret = Post.objects.aggregate(Max("id"))['id__max']
    return ret

def get_next_id(curr_id):
    try:
        ret = Post.objects.filter(id__gt=curr_id).order_by("id")[0:1].get().id
    except Post.DoesNotExist:
        ret = Post.objects.aggregate(Min("id"))['id__min']
    return ret


def blog_single(request,pid):
    
    
    post=get_object_or_404(Post,pk=pid, status=1)
    post.content_view = post.content_view + 1
    post.save()

    previd=get_prev_id(pid)
    nextid=get_next_id(pid)
    nextpost=get_object_or_404(Post,pk=nextid, status=1)
    prevpost=get_object_or_404(Post,pk=previd, status=1)
    
    context={'post':post ,'nextpost':nextpost,'prevpost':prevpost}
    return render(request,'blog/blog-single.html',context)
    

def test(request):
   # posts=Post.objects.all()
    #context={'name':name}
    return render(request,'test.html')    

def blog_category(request,cat_name):
    posts=Post.objects.filter(status=1)
    posts=posts.filter(category__name=cat_name)
    context={'posts':posts}
    return render(request,'blog/blog-home.html',context)

def blog_search(request):
    posts= Post.objects.filter(status=1)
    if request.method=='GET':
        if s:=request.GET.get('s'):
            posts=posts.filter(content__contains=s)

    context={'posts':posts}
    return render(request,'blog/blog-home.html',context)
