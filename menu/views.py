from multiprocessing import context
from django.shortcuts import render, redirect
from .models import Recipe, Menu
from .forms import RecipeForm, MenuForm
import os

# Create your views here.

def index(request):
    return render(request, 'pages/index.html')

def aboutus(request):
    return render(request, 'pages/aboutus.html')

def recipes_list(request):
    recipes = Recipe.objects.all()
    return render(request, 'recipes/recipes_list.html', {'recipes': recipes})

def add_recipe(request):
    form = RecipeForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        form.save()
        return redirect('recipes')
    return render(request, 'recipes/add.html', {'form': form})

def modify(request, id):
    recipe = Recipe.objects.get(id=id)
    form = RecipeForm(request.POST or None, request.FILES or None, instance=recipe)
    if len(request.FILES) != 0:
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

def delete(request, id):
    recipe = Recipe.objects.get(id=id)
    recipe.delete()
    return redirect('recipes')

def menu (request):
    sql = "SELECT * FROM menu_recipe"
    recipes = Recipe.objects.raw(sql)
    form = MenuForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('weekly_menu')
    return render(request, 'recipes/menu.html', {'recipes': recipes})

def weekly_menu(request):
    mon_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE monday_breakfast_id = menu_recipe.id or monday_lunch_id = menu_recipe.id or monday_dinner_id = menu_recipe.id "
    mon_menu = Menu.objects.raw(mon_sql)
    tue_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE tuesday_breakfast_id = menu_recipe.id or tuesday_lunch_id = menu_recipe.id or tuesday_dinner_id = menu_recipe.id "
    tue_menu = Menu.objects.raw(tue_sql)
    wed_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE wednesday_breakfast_id = menu_recipe.id or wednesday_lunch_id = menu_recipe.id or wednesday_dinner_id = menu_recipe.id "
    wed_menu = Menu.objects.raw(wed_sql)    
    thu_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE thursday_breakfast_id = menu_recipe.id or thursday_lunch_id = menu_recipe.id or thursday_dinner_id = menu_recipe.id "
    thu_menu = Menu.objects.raw(thu_sql)
    fri_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE friday_breakfast_id = menu_recipe.id or friday_lunch_id = menu_recipe.id or friday_dinner_id = menu_recipe.id "
    fri_menu = Menu.objects.raw(fri_sql)
    sat_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE saturday_breakfast_id = menu_recipe.id or saturday_lunch_id = menu_recipe.id or saturday_dinner_id = menu_recipe.id "
    sat_menu = Menu.objects.raw(sat_sql)
    sun_sql = "SELECT menu_menu.id, title, photo, type, ingredients, instructions FROM menu_recipe join menu_menu  WHERE sunday_breakfast_id = menu_recipe.id or sunday_lunch_id = menu_recipe.id or sunday_dinner_id = menu_recipe.id "    
    sun_menu = Menu.objects.raw(sun_sql)

    context = {'mon_menu': mon_menu, 'tue_menu': tue_menu, 'wed_menu': wed_menu, 'thu_menu': thu_menu, 'fri_menu': fri_menu, 'sat_menu': sat_menu, 'sun_menu': sun_menu}
    return render(request, 'recipes/weekly_menu.html', context)

def shopping_list(request):
    mon_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where monday_breakfast_id = menu_recipe.id or monday_lunch_id = menu_recipe.id or monday_dinner_id = menu_recipe.id "
    mon_ingredients = Menu.objects.raw(mon_sql)
    tue_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where tuesday_breakfast_id = menu_recipe.id or tuesday_lunch_id = menu_recipe.id or tuesday_dinner_id = menu_recipe.id "
    tue_ingredients = Menu.objects.raw(tue_sql)
    wed_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where wednesday_breakfast_id = menu_recipe.id or wednesday_lunch_id = menu_recipe.id or wednesday_dinner_id = menu_recipe.id "
    wed_ingredients = Menu.objects.raw(wed_sql)
    thu_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where thursday_breakfast_id = menu_recipe.id or thursday_lunch_id = menu_recipe.id or thursday_dinner_id = menu_recipe.id "
    thu_ingredients = Menu.objects.raw(thu_sql) 
    fri_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where friday_breakfast_id = menu_recipe.id or friday_lunch_id = menu_recipe.id or friday_dinner_id = menu_recipe.id "
    fri_ingredients = Menu.objects.raw(fri_sql)
    sat_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where saturday_breakfast_id = menu_recipe.id or saturday_lunch_id = menu_recipe.id or saturday_dinner_id = menu_recipe.id "
    sat_ingredients = Menu.objects.raw(sat_sql)
    sun_sql = "SELECT menu_menu.id, ingredients from menu_recipe join menu_menu where sunday_breakfast_id = menu_recipe.id or sunday_lunch_id = menu_recipe.id or sunday_dinner_id = menu_recipe.id "
    sun_ingredients = Menu.objects.raw(sun_sql)

    context = {'mon_ingredients': mon_ingredients, 'tue_ingredients': tue_ingredients, 'wed_ingredients': wed_ingredients, 'thu_ingredients': thu_ingredients, 'fri_ingredients': fri_ingredients, 'sat_ingredients': sat_ingredients, 'sun_ingredients': sun_ingredients}
    return render(request, 'recipes/shopping_list.html', context)