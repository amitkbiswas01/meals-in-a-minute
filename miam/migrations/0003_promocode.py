# Generated by Django 3.1.5 on 2021-01-18 15:07

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('miam', '0002_adbookmark'),
    ]

    operations = [
        migrations.CreateModel(
            name='PromoCode',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('name', models.CharField(max_length=50, verbose_name='Code Name')),
                ('percentage', models.IntegerField(verbose_name='Percentage')),
                ('advertisement', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='miam.advertisement', verbose_name='Advertisement')),
            ],
            options={
                'verbose_name': 'Promo Code',
                'verbose_name_plural': 'Promo Codes',
            },
        ),
    ]
