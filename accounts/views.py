from django.shortcuts import render,redirect
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.forms import AuthenticationForm,UserCreationForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView
from accounts.forms import EmailOrUsernameAuthenticationForm
from django.contrib.auth.views import PasswordResetView,PasswordResetView, PasswordResetDoneView
from django.urls import reverse_lazy


class CustomLoginView(LoginView):
    form_class = EmailOrUsernameAuthenticationForm
    template_name = 'accounts/login.html'

def login_view(request):
    # if request.user.is_authenticated:
    #     msg= f'user is authenticated as {request.user.username}'
    # else:
    #     msg='user is not authenticated'   
    if not request.user.is_authenticated:
     
        if request.method == 'POST':
            form=AuthenticationForm(request=request,data=request.POST)
            if form.is_valid():
                username=form.cleaned_data.get('username')
                password=form.cleaned_data.get('password')
                user = authenticate(username=username, password=password)
                if user is not None:
                    login(request, user)
                    return redirect('/')
                
        form= AuthenticationForm() 
        context={'form':form}   
        return render(request,'accounts/login.html',context)
    else:
        return redirect('/')
    
@login_required        
def logout_view(request):
    
    logout(request)
    return redirect('/')

def signup_view(request):
    if not request.user.is_authenticated:
        if request.method=='POST':
            form=UserCreationForm(request.POST)
            if form.is_valid():
                form.save()
                return redirect('/')
        form=UserCreationForm()    
        context={'form':form}
        return render(request,'accounts/signup.html',context)
    else:
        return redirect('/')
    
from django.contrib.auth.views import PasswordResetView

class CustomPasswordResetView(PasswordResetView):
    template_name = 'accounts/password_reset_form.html'
    email_template_name = 'accounts/password_reset_email.html'
    success_url = reverse_lazy('password_reset_done')

class CustomPasswordResetDoneView(PasswordResetDoneView):
    template_name = 'accounts/password_reset_done.html'    



# Create your views here.
