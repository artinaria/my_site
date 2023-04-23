from django.shortcuts import render,redirect
from django.http import HttpResponse,HttpResponseRedirect
from website.models import Newsletter,Contact
from website.forms import NewsletterForm,ContactForm
from django.contrib import messages
from django.shortcuts import render


def index_view(request):
    return render(request,'website/index.html')

def about_view(request):
    return render(request,'website/about.html')

def contact_view(request):
    

        
    if request.method =='POST':
        
     
        form=ContactForm(request.POST)
        if form.is_valid():
                                 
            form.save()
            # messages.add_message(request,messages.SUCCESS,'Your messsage is submited successfully')
            
            messages.success(request, "Message sent." )
            return redirect('website:contact')

        else:
            # messages.add_message(request,messages.ERROR,'Your messsage is failed')
            messages.error(request, "Error. Message not sent.")


    form=ContactForm()       
     
    return render(request,'website/contact.html',{'form':form})

def newsletter_view(request): 
    if request.method == 'POST':
        form=NewsletterForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/')
    else:
        return HttpResponseRedirect('/')
