from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required, permission_required
import os
from .models import Recipe, Menu
from .forms import RecipeForm, MenuForm

# Create your views here.

"""
views.py includes all the necessary functions for the app to work and show the correspondant information to the user.

imports:
    render and redirect functions to help visualize the content from the app, rendering information included from the forms.
    Recipe and Menu models to be able to render the data sent through the form according to the model created and the fields on the DB.
    RecipeForm and MenuForm to validate the data sent through the app to contrast it against the model.
    os package to interact with the operative system, in this case, in order to delete an image.
    login_required decorator to ensure that the user is logged in before accessing the app.
    permission_required decorator to ensure that the user has the permission to access the app.
"""

@login_required(login_url='/login/')
def index(request):
    """Render the index page per user request, which is used as parameter for this function."""
    return render(request, 'pages/index.html')

@login_required(login_url='/login/')
def aboutus(request):
    """Render the about us page per user request, which is used as parameter for this function."""
    return render(request, 'pages/aboutus.html')

@login_required(login_url='/login/')
@permission_required('menu.view_recipe', login_url='/login/')
def recipes_list(request):
    """Render the list of recipes availables at this time per user request, which is used as parameter for this function."""
    #The following line queries the DB for all recipes, parse them onto objects based on the Recipe model and send it as a parameter for the render function
    recipes = Recipe.objects.all()
    return render(request, 'recipes/recipes_list.html', {'recipes': recipes})

@login_required(login_url='/login/')
@permission_required('menu.add_recipe', login_url='/login/')
def add_recipe(request):
    """Render the page to add a recipe to the DB per user request, which is used as parameter for this function."""
    #This function takes the data sent through the form, validate it based on the model, if it's correct it'll save the recipe, otherwise it'll render the page again.
    form = RecipeForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        form.save()
        return redirect('recipes')
    return render(request, 'recipes/add.html', {'form': form})

@login_required(login_url='/login/')
@permission_required('menu.change_recipe', login_url='/login/')
def modify(request, id):
    """Render the recipe edition page per admin request. It takes request from the user as parameters and the id of the recipe the user'd like to edit. """
    #Get everything from the recipe
    recipe = Recipe.objects.get(id=id)
    #Get data from the form
    form = RecipeForm(request.POST or None, request.FILES or None, instance=recipe)
    if len(request.FILES) != 0:
        #When the image is being updated, the previous image needs to be deleted first
            if len(recipe.photo) > 0:
                os.remove(recipe.photo.path)
            recipe.photo = request.FILES['photo']
            recipe.title = request.POST.get('title')
            recipe.ingredients = request.POST.get('ingredients')
            recipe.instructions = request.POST.get('instructions')
            recipe.save()
            #messages.success(request, "¡Receta actualizada correctamente!")
            return redirect('recipes')
    return render(request, 'recipes/modify.html', {'form': form})

@login_required(login_url='/login/')
@permission_required('menu.delete_recipe', login_url='/login/') 
def delete(request, id):
    """This function deletes a recipe from the app. It takes request parameter from the user and the recipe's id so it can be deleted from the DB. """
    #Capture id of the receipe we want to delete 
    recipe = Recipe.objects.get(id=id)
    recipe.delete()
    return redirect('recipes')

@login_required(login_url='/login/')
def menu (request):
    """Render the menu creation page per user request, which is used as parameter for this function."""
    #Get all available recipes and throw them to the user so they can select the ones they want
    sql = "SELECT * FROM menu_recipe"
    recipes = Recipe.objects.raw(sql)
    if request.method == 'POST':
        form = MenuForm(request.POST)
        if form.is_valid():
            frm = form.save(commit=False)
            frm.user = request.user
            frm.save()  
            return redirect('weekly_menu')
    return render(request, 'recipes/menu.html', {'recipes': recipes})


@login_required(login_url='/login/')
def weekly_menu(request):
    """Render the page where the user can visualize the menu they created. Request parameter for when user request it. """

    #Query data from the recipes the user selected
    mon_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE monday_breakfast_id = menu_recipe.id or monday_lunch_id = menu_recipe.id or monday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3" 
    mon_menu = Menu.objects.raw(mon_sql)
    tue_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE tuesday_breakfast_id = menu_recipe.id or tuesday_lunch_id = menu_recipe.id or tuesday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    tue_menu = Menu.objects.raw(tue_sql)
    wed_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE wednesday_breakfast_id = menu_recipe.id or wednesday_lunch_id = menu_recipe.id or wednesday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    wed_menu = Menu.objects.raw(wed_sql)    
    thu_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE thursday_breakfast_id = menu_recipe.id or thursday_lunch_id = menu_recipe.id or thursday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    thu_menu = Menu.objects.raw(thu_sql)
    fri_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE friday_breakfast_id = menu_recipe.id or friday_lunch_id = menu_recipe.id or friday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    fri_menu = Menu.objects.raw(fri_sql)
    sat_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE saturday_breakfast_id = menu_recipe.id or saturday_lunch_id = menu_recipe.id or saturday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    sat_menu = Menu.objects.raw(sat_sql)
    sun_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE sunday_breakfast_id = menu_recipe.id or sunday_lunch_id = menu_recipe.id or sunday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"    
    sun_menu = Menu.objects.raw(sun_sql)

    #Recipes' data is stored on a dictionary which is sent as a context for the app to renderize the data and present it to the user
    context = {'mon_menu': mon_menu, 'tue_menu': tue_menu, 'wed_menu': wed_menu, 'thu_menu': thu_menu, 'fri_menu': fri_menu, 'sat_menu': sat_menu, 'sun_menu': sun_menu}
    return render(request, 'recipes/weekly_menu.html', context)

@login_required(login_url='/login/')
def shopping_list(request):
    """Render the shopping list page per user request, which is used as parameter to this function."""
    
    #Query the ingredients from the recipes the user selected
    mon_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where monday_breakfast_id = menu_recipe.id or monday_lunch_id = menu_recipe.id or monday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    mon_ingredients = Menu.objects.raw(mon_sql)
    tue_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where tuesday_breakfast_id = menu_recipe.id or tuesday_lunch_id = menu_recipe.id or tuesday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    tue_ingredients = Menu.objects.raw(tue_sql)
    wed_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where wednesday_breakfast_id = menu_recipe.id or wednesday_lunch_id = menu_recipe.id or wednesday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    wed_ingredients = Menu.objects.raw(wed_sql)
    thu_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where thursday_breakfast_id = menu_recipe.id or thursday_lunch_id = menu_recipe.id or thursday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    thu_ingredients = Menu.objects.raw(thu_sql) 
    fri_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where friday_breakfast_id = menu_recipe.id or friday_lunch_id = menu_recipe.id or friday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    fri_ingredients = Menu.objects.raw(fri_sql)
    sat_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where saturday_breakfast_id = menu_recipe.id or saturday_lunch_id = menu_recipe.id or saturday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    sat_ingredients = Menu.objects.raw(sat_sql)
    sun_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where sunday_breakfast_id = menu_recipe.id or sunday_lunch_id = menu_recipe.id or sunday_dinner_id = menu_recipe.id ORDER BY menu_menu.id DESC LIMIT 3"
    sun_ingredients = Menu.objects.raw(sun_sql)

    #Store ingredients on a dictionary which is sent as a context for the app to renderize the data and present it to the user
    context = {'mon_ingredients': mon_ingredients, 'tue_ingredients': tue_ingredients, 'wed_ingredients': wed_ingredients, 'thu_ingredients': thu_ingredients, 'fri_ingredients': fri_ingredients, 'sat_ingredients': sat_ingredients, 'sun_ingredients': sun_ingredients}
    return render(request, 'recipes/shopping_list.html', context)