from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Recipe(models.Model):

    """Class Recipe constructs the model on which the correspondent database table is created."""

    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=100, null=True, verbose_name="Título")
    type = models.CharField(max_length=20, null=True)
    ingredients = models.TextField(max_length=10000, null=True)
    instructions = models.TextField(max_length=10000, null=True)
    photo = models.ImageField(upload_to='images/', null=True)

    def __str__(self) -> str:

        """
        It defines the data type of the object associated to this class. It will return the specified parameter (title) as a string.
        :type: str -> this method returns a string.
        
        """

        title = self.title 
        return title

    def delete(self):

        """
        This method is created to delete both the picture and the data from the DB when deleting a row from the CRUD app.
        It takes self, the object, as a parameter to capture image's path and data row to delete it.
        """

        self.photo.storage.delete(self.photo.name)
        super().delete()

class Menu(models.Model):

    """Class Menu constructs the model on which the correspondent database table is created."""

    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='menu', null=True)
    monday_breakfast = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='monday_breakfast', null=True)
    monday_lunch = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='monday_lunch', null=True)
    monday_dinner = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='monday_dinner', null=True)
    tuesday_breakfast = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='tuesday_breakfast', null=True)
    tuesday_lunch = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='tuesday_lunch', null=True)
    tuesday_dinner = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='tuesday_dinner', null=True)
    wednesday_breakfast = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='wednesday_breakfast', null=True)
    wednesday_lunch = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='wednesday_lunch', null=True)
    wednesday_dinner = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='wednesday_dinner', null=True)
    thursday_breakfast = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='thursday_breakfast', null=True)
    thursday_lunch = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='thursday_lunch', null=True)  
    thursday_dinner = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='thursday_dinner', null=True)
    friday_breakfast = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='friday_breakfast', null=True)
    friday_lunch = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='friday_lunch', null=True)
    friday_dinner = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='friday_dinner', null=True)
    saturday_breakfast = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='saturday_breakfast', null=True)
    saturday_lunch = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='saturday_lunch', null=True)
    saturday_dinner = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='saturday_dinner', null=True)
    sunday_breakfast = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='sunday_breakfast', null=True)
    sunday_lunch = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='sunday_lunch', null=True)
    sunday_dinner = models.ForeignKey(Recipe, on_delete=models.CASCADE, related_name='sunday_dinner', null=True)