from django import forms
from website.models import Newsletter,Contact
from captcha.fields import CaptchaField




class NewsletterForm(forms.ModelForm):
    
    class Meta:
        model=Newsletter
        fields='__all__'

class ContactForm(forms.ModelForm):
    
    def clean_name(self):
        name=self.cleaned_data['name']
        name='unkown'
        return name
    
    captcha = CaptchaField()
    class Meta:
        model=Contact
        fields='__all__' 
        

  
        
     