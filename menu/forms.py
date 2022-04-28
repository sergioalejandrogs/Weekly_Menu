from django import forms
from .models import Recipe, Menu

class RecipeForm(forms.ModelForm):

    """RecipeForm class helps validating the information introduced onto the forms to validate it matches the model created for Recipes."""

    class Meta:

        """Metaclass for RecipeForm class shows how it behaves: it takes Recipe as the model and validates form fields against the model created."""

        model = Recipe
        fields = '__all__'

class MenuForm(forms.ModelForm):

    """MenuForm class helps validating the information introduced onto the forms to validate it matches the model created for Menus."""

    class Meta:

        """Metaclass for MenuForm class shows how it behaves: it takes Recipe as the model and validates form fields against the model created."""
        
        model = Menu
        fields = ['monday_breakfast',
        'monday_lunch', 
        'monday_dinner', 
        'tuesday_breakfast', 
        'tuesday_lunch', 
        'tuesday_dinner', 
        'wednesday_breakfast', 
        'wednesday_lunch', 
        'wednesday_dinner', 
        'thursday_breakfast', 
        'thursday_lunch', 
        'thursday_dinner', 
        'friday_breakfast', 
        'friday_lunch', 
        'friday_dinner', 
        'saturday_breakfast', 
        'saturday_lunch', 
        'saturday_dinner',
        'sunday_breakfast',
        'sunday_lunch',
        'sunday_dinner',]