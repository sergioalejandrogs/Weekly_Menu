# Generated by Django 3.2.6 on 2022-04-05 00:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('menu', '0003_rename_recipes_recipe'),
    ]

    operations = [
        migrations.AlterField(
            model_name='recipe',
            name='type',
            field=models.CharField(choices=[('Desayuno', 'Desayuno'), ('Almuerzo', 'Almuerzo'), ('Cena', 'Cena')], default='Almuerzo', max_length=10),
        ),
    ]