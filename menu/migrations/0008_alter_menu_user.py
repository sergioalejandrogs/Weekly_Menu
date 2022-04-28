# Generated by Django 3.2.6 on 2022-04-13 23:25

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('menu', '0007_menu_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='menu',
            name='user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='menu', to=settings.AUTH_USER_MODEL),
        ),
    ]