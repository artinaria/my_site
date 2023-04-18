from django.contrib import admin
from django.urls import path,include
from . import views
from .views import CustomPasswordResetView
from django.contrib.auth.views import PasswordResetConfirmView,PasswordResetDoneView,PasswordResetCompleteView
app_name='accounts'


urlpatterns = [
    
    path('login/',views.login_view,name='login'),
    path('logout',views.logout_view,name='logout'),
    path('signup/',views.signup_view,name='signup'),
    path('password_reset/', CustomPasswordResetView.as_view(), name='password_reset'),
    path('password_reset/done/', PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('reset/done/', PasswordResetCompleteView.as_view(), name='password_reset_complete'),

    
   
]
