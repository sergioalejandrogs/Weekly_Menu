# Generated by Django 3.2.6 on 2022-04-04 20:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('menu', '0002_rename_recipe_recipes'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='recipes',
            new_name='recipe',
        ),
    ]
