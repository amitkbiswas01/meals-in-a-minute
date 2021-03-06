# Generated by Django 3.1.5 on 2021-01-19 06:43

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('email', models.EmailField(max_length=255, unique=True, verbose_name='Email')),
                ('full_name', models.CharField(max_length=255, verbose_name='Name')),
                ('phone_no', models.CharField(blank=True, max_length=17, validators=[django.core.validators.RegexValidator(message='Invalid Phone Number', regex='^[0-9]{0,14}$')])),
                ('user_type', models.CharField(choices=[('seller', 'seller'), ('buyer', 'buyer')], max_length=50, verbose_name='User Type')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Joined')),
                ('is_staff', models.BooleanField(default=False)),
                ('is_superuser', models.BooleanField(default=False)),
                ('is_active', models.BooleanField(default=True)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'User',
                'verbose_name_plural': 'Users',
            },
        ),
        migrations.CreateModel(
            name='BuyerProfile',
            fields=[
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='accounts.user', verbose_name='User')),
                ('address', models.TextField(blank=True, verbose_name='Address')),
            ],
            options={
                'verbose_name': 'Buyer Profile',
                'verbose_name_plural': 'Buyer Profiles',
            },
        ),
        migrations.CreateModel(
            name='SellerProfile',
            fields=[
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='accounts.user', verbose_name='User')),
                ('location', models.CharField(choices=[('Dhaka', 'Dhaka'), ('Chattogram', 'Chattogram'), ('Khulna', 'Khulna'), ('Rajshahi', 'Rajshahi'), ('Barisal', 'Barisal'), ('Rangpur', 'Rangpur'), ('Sylhet', 'Sylhet'), ('Mymensingh', 'Mymensingh')], max_length=255, verbose_name='Location')),
                ('company_name', models.CharField(blank=True, max_length=255, verbose_name='Company Name')),
                ('food_category', models.CharField(blank=True, max_length=255, verbose_name='Food Catogory')),
            ],
            options={
                'verbose_name': 'Seller Profile',
                'verbose_name_plural': 'Seller Profiles',
            },
        ),
    ]
