from django.urls import path
from . import views
from django.conf import settings
from django.contrib.staticfiles.urls import static 

"""
The following list captures the necessary data in order to move across diferent pages of the app.
'path' takes as parameters the written url, the function imported from views.py and the name used to call the specific path on the html templates and rendered views.
"""

urlpatterns = [
    path('index/', views.index, name='index'),
    path('aboutus/', views.aboutus, name='aboutus'),
    path('recipes/', views.recipes_list, name='recipes'),
    path('recipes/add/', views.add_recipe, name='add'),
    path('recipes/modify/<int:id>/', views.modify, name='modify'),
    path('recipes/delete/<int:id>/', views.delete, name='delete'),
    path('menu/', views.menu, name='menu'),
    path('weekly_menu/', views.weekly_menu, name='weekly_menu'), 
    path('shopping_list/', views.shopping_list, name='shopping_list'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)