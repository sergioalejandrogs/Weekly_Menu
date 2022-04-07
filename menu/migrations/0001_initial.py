# Generated by Django 3.2.6 on 2022-04-04 19:51

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='recipe',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=100, null=True, verbose_name='Título')),
                ('type', models.CharField(max_length=20, null=True)),
                ('ingredients', models.TextField(max_length=10000, null=True, verbose_name='Ingredientes')),
                ('instructions', models.TextField(max_length=10000, null=True, verbose_name='Instrucciones')),
                ('photo', models.ImageField(null=True, upload_to='images/', verbose_name='Imagen')),
            ],
        ),
    ]