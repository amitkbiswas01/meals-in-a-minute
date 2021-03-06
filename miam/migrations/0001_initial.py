# Generated by Django 3.1.5 on 2021-01-19 06:43

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Advertisement',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=1024, verbose_name='Title')),
                ('price', models.IntegerField(verbose_name='Price')),
                ('location', models.CharField(choices=[('Dhaka', 'Dhaka'), ('Chattogram', 'Chattogram'), ('Khulna', 'Khulna'), ('Rajshahi', 'Rajshahi'), ('Barisal', 'Barisal'), ('Rangpur', 'Rangpur'), ('Sylhet', 'Sylhet'), ('Mymensingh', 'Mymensingh')], max_length=255, verbose_name='Location')),
                ('category', models.CharField(choices=[('bengali_food', 'Homemade Bengali Food'), ('street_food', 'Street Food'), ('sea_food', 'Sea Food'), ('drinks', 'Drinks and Juices'), ('sweets', 'Sweets and Pithas'), ('bakery', 'Cakes and Bakery')], max_length=256, verbose_name='Food Category')),
                ('description', models.TextField(verbose_name='Description')),
                ('photo', models.ImageField(upload_to='ads', verbose_name='Photo')),
                ('available_from', models.DateTimeField(auto_now_add=True, verbose_name='Available from')),
                ('available_till', models.DateTimeField(verbose_name='Available till')),
                ('seller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='accounts.sellerprofile', verbose_name='Seller')),
            ],
            options={
                'verbose_name': 'Advertisement',
                'verbose_name_plural': 'Advertisements',
            },
        ),
        migrations.CreateModel(
            name='UserReview',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('description', models.TextField(verbose_name='Review Description')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('review_of', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reviewof', to=settings.AUTH_USER_MODEL, verbose_name='Review Of')),
                ('reviewed_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reviewedby', to=settings.AUTH_USER_MODEL, verbose_name='Reviewed By')),
            ],
            options={
                'verbose_name': 'User Review',
                'verbose_name_plural': 'User Reviews',
            },
        ),
        migrations.CreateModel(
            name='PromoCode',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50, verbose_name='Code Name')),
                ('percentage', models.IntegerField(verbose_name='Percentage')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('advertisement', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='miam.advertisement', verbose_name='Advertisement')),
                ('seller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='accounts.sellerprofile', verbose_name='Seller')),
            ],
            options={
                'verbose_name': 'Promo Code',
                'verbose_name_plural': 'Promo Codes',
            },
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('quantity', models.IntegerField(verbose_name='Quantity')),
                ('total_price', models.IntegerField(verbose_name='Total Price')),
                ('is_delivered', models.BooleanField(default=False, verbose_name='Is Delivered')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('advertisement', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='miam.advertisement', verbose_name='Advertisement')),
                ('buyer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='accounts.buyerprofile', verbose_name='Buyer')),
            ],
            options={
                'verbose_name': 'Order',
                'verbose_name_plural': 'Orders',
            },
        ),
        migrations.CreateModel(
            name='AdReview',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('description', models.TextField(verbose_name='Review Description')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('advertisement', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='miam.advertisement', verbose_name='Advertisement')),
                ('reviewed_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='accounts.buyerprofile', verbose_name='Reviewed By')),
            ],
            options={
                'verbose_name': 'Advertisement Review',
                'verbose_name_plural': 'Advertisement Reviews',
            },
        ),
        migrations.CreateModel(
            name='AdBookmark',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('advertisement', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='miam.advertisement', verbose_name='Advertisement')),
                ('bookmarked_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='accounts.buyerprofile', verbose_name='Reviewed By')),
            ],
            options={
                'verbose_name': 'Advertisement Bookmark',
                'verbose_name_plural': 'Advertisement Bookmarks',
            },
        ),
    ]
