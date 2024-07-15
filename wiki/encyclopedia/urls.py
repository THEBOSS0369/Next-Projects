from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("wiki/", views.random_page, name="random_page"),
    path("wiki/<str:title>", views.entry, name="entry"),
    path("search/", views.search, name="search"),
    path("new", views.new, name="new"),
    path("edit/", views.edit, name="edit"),
    path("new_edit/", views.new_edit, name="new_edit"),
]
