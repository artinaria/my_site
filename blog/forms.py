from django import forms
from blog.models import comment
from captcha.fields import CaptchaField


class CommentForm(forms.ModelForm):
       
    class Meta:
        model=comment
        fields=['post','name','email','subject','message']