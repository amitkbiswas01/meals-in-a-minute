# Generated by Django 3.1.5 on 2021-01-19 05:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('miam', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='is_delivered',
            field=models.BooleanField(default=False, verbose_name='Is Delivered'),
        ),
    ]
