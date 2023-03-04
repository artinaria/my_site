from django.contrib import admin

from website.models import Contact,Newsletter

class ContactAdmin(admin.ModelAdmin):
    date_hierarchy='created_date'
    list_display=('name','email','created_date')
    list_filter=('email',)
    search_fields=['name','subject','message']
    

admin.site.register(Contact,ContactAdmin)    
admin.site.register(Newsletter)  

