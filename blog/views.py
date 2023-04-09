from django.shortcuts import render,get_object_or_404,redirect
from blog.models import Post,comment
from django.utils import timezone
from django.db.models import Max, Min
from django.core.paginator import Paginator,PageNotAnInteger,EmptyPage
from blog.forms import CommentForm
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.urls import reverse
from django.http import HttpResponseRedirect



def blog_view(request,**kwargs):
    posts= Post.objects.filter(status=1,published_date__lte=timezone.now())
    if kwargs.get('cat_name')!= None:
        posts=posts.filter(category__name=kwargs['cat_name'])
    if kwargs.get('author_username')!= None:
        posts=posts.filter(author__username=kwargs['author_username'])
    if kwargs.get('tag_name')!= None:
        posts=posts.filter(tags__name__in=[kwargs['tag_name']])  

    posts=Paginator(posts,2)  
    try: 
        page_number=request.GET.get('page')  
        posts=posts.get_page(page_number)
    except PageNotAnInteger:
        posts=posts.get_page(1)
    except EmptyPage:
        posts=posts.get_page(1)   



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
    
    if request.method=='POST':
        form=CommentForm(request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(request,messages.SUCCESS,'Your Comment Send Successfully')
            
        else:
            messages.add_message(request,messages.ERROR,'Your Comment Failed')    

    post=get_object_or_404(Post,pk=pid, status=1)
    if not post.login_require: 
        post.content_view = post.content_view + 1
        post.save()
        comments=comment.objects.filter(post=post.id,approved=True)
        form=CommentForm()

        previd=get_prev_id(pid)
        nextid=get_next_id(pid)
        nextpost=get_object_or_404(Post,pk=nextid, status=1)
        prevpost=get_object_or_404(Post,pk=previd, status=1)
        
        context={'post':post ,'nextpost':nextpost,'prevpost':prevpost,'comments':comments,'form':form}
        return render(request,'blog/blog-single.html',context)
    else: 
        return HttpResponseRedirect(reverse('accounts:login'))
    

def test(request):
   # posts=Post.objects.all()
    #context={'name':name}
    return render(request,'test.html')    

def blog_category(request,cat_name):
    posts=Post.objects.filter(status=1)
    posts=posts.filter(category__name=cat_name)
    context={'posts':posts}
    return render(request,'blog/blog-home.html',context)