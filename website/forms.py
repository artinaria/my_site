from django import forms
from website.models import Newsletter,Contact



class NewsletterForm(forms.ModelForm):
    
    class Meta:
        model=Newsletter
        fields='__all__'

class ContactForm(forms.ModelForm):
    def clean_name(self):
        name=self.cleaned_data['name']
        name='unkown'
        return name
    
    class Meta:
        model=Contact
        fields='__all__' 
        

  
        
     