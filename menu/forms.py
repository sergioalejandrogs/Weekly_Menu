from django import forms
from .models import Recipe, Menu

class RecipeForm(forms.ModelForm):
    class Meta:
        model = Recipe
        fields = '__all__'

class MenuForm(forms.ModelForm):
    class Meta:
        model = Menu
        fields = '__all__'