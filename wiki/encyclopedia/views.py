from django.shortcuts import render
import markdown2
from markdown2 import Markdown
from django import forms
from django.contrib import messages
from django.shortcuts import redirect
import random
from django.http import HttpResponseBadRequest
from django.utils.datastructures import MultiValueDictKeyError

from . import util


def index(request):
    return render(request, "encyclopedia/index.html", {
        "entries": util.list_entries()
    })

def convert_to_HTML(entry_name):
    md = markdown2.Markdown()
    entry  = util.get_entry(entry_name)
    html = md.convert(entry) if entry else None
    return html

def entry(request, title):
    mdStr = util.get_entry(title)
    print(mdStr)
    if mdStr:
        html = markdown2.markdown(mdStr)
        print(html)
        return render(request, "encyclopedia/entry.html", {
            "entry": html
        })
    else:
        return render(request, "encyclopedia/error.html", {
                "message": "No Entry"
            })
    
def search(request):
    if request.method == 'POST':
        input = request.POST['q']
        html = convert_to_HTML(input)

        entries = util.list_entries()
        if input in entries:
            return render(request, "encyclopedia/entry.html", {
                "entry": html,
                "entry.title": input
            })
        else:
            allentries = util.list_entries()
            recommendation = []
            for entry in allentries:
                if input.lower() in entry.lower():
                    recommendation.append(entry)
            return render(request, "encyclopedia/search.html", {
                "recommendation": recommendation
            })
        
class NewEntryForm(forms.Form):
    title = forms.CharField(
        required=True,
        label="",
        widget=forms.TextInput(
            attrs={"placeholder": "Title", "class": "mb-4"}
        ),
    )
    content = forms.CharField(
        required=True,
        label="",
        widget=forms.Textarea(
            attrs={
                "class": "form-control mb-4",
                "placeholder": "Content (markdown)",
                "id": "new_content",
            }
        ),
    )   
        
def new(request):
    if request.method == "GET":
        return render(
            request, "encyclopedia/new.html", {"form": NewEntryForm()}
        )

    form = NewEntryForm(request.POST)
    if form.is_valid():
        title = form.cleaned_data.get("title")
        content = form.cleaned_data.get("content")

        if title.lower() in [entry.lower() for entry in util.list_entries()]:
            messages.add_message(
                request,
                messages.WARNING,
                message=f'Entry "{title}" already exists',
            )
        else:
            with open(f"entries/{title}.md", "w") as file:
                file.write(content)
            return redirect("entry", title)

    else:
        messages.add_message(request, messages.WARNING, message="Invalid request form")

    return render(request,"encyclopedia/new.html",{
        "form": form
    })
    
def random_page(request):
    entries = util.list_entries()
    selected_page = random.choice(entries)
    content = util.get_entry(selected_page)
    print(f"Selected Page: {selected_page}, Content: {content}")
    return render(request, "encyclopedia/layout.html", {
        "title": selected_page,
        "content": content
    })

def edit(request):
    if request.method == "POST":
        title = request.POST['entry_title']
        content = util.get_entry(title)
        return render(request, "encyclopedia/edit.html", {
            "entry": content,
            "entry_title": title
        })
    
def new_edit(request):
    if request.method == "POST":
        title = request.POST.get('entry_title')
        content = request.POST['content']
        util.save_entry(title, content)
        html = convert_to_HTML(title)
        return render(request, "encyclopedia/entry.html", {
            "entry": html,
            "entry.title": content
        })