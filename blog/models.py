from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from taggit.managers import TaggableManager


# Create your models here.

class Category(models.Model):
    name=models.CharField(max_length=300)
    def __str__(self):
        return self.name
    

class Post(models.Model):
    author=models.ForeignKey(User ,on_delete=models.SET_NULL,null=True)
    title=models.CharField(max_length=255)
    image=models.ImageField(upload_to='blog/',default='blog/default.jpg')
    category=models.ManyToManyField(Category)
    tags = TaggableManager()

    content=models.TextField()
    content_view=models.IntegerField(default=0)
    status=models.BooleanField()
    login_require=models.BooleanField(default=False)
    published_date=models.DateTimeField(null=True)
    created_date=models.DateTimeField(auto_now_add=True)
    updated_date=models.DateTimeField(auto_now=True)
  
    
    class Meta():
        ordering =['-created_date']  
    def __str__(self):
        return "{}-{}".format(self.title,self.id)

    def snippest(self):
        
        return self.content[:100]
    def get_absolute_url(self):
        return reverse('blog:single',kwargs={'pid':self.id})
        
class comment(models.Model):
    post=models.ForeignKey(Post,on_delete=models.CASCADE)
    name=models.CharField(max_length=255)
    email=models.EmailField()
    subject=models.CharField(max_length=255) 
    message=models.TextField()
    created_date=models.DateTimeField(auto_now_add=True)    
    uodated_date=models.DateTimeField(auto_now_add=True)    
    approved=models.BooleanField(default=False)  

    class Meta():
        ordering=['-created_date']

    def __str__(self):
        return self.name
                                        