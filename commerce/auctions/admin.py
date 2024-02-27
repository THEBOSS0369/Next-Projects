from django.contrib import admin
from .models import Listing, User, Category, Comment, Bid

# Register your models here.
admin.site.register(Listing)
admin.site.register(User)
admin.site.register(Category)
admin.site.register(Comment)
admin.site.register(Bid)