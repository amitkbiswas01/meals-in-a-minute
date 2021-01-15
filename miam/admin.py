from django.contrib import admin

from .models import Advertisement, Order, Review


@admin.register(Advertisement)
class AdvertisementAdmin(admin.ModelAdmin):
    model = Advertisement

    list_display = (
        "get_full_name",
        "title",
        "price",
        "location",
        "category",
        "description",
        "photo",
        "available_till",
    )

    def get_full_name(self, instance):
        return instance.seller.user.full_name

    get_full_name.short_description = "Seller Name"


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    model = Order

    list_display = (
        "get_full_name",
        "get_title",
        "quantity",
    )

    def get_full_name(self, instance):
        return instance.buyer.user.full_name

    get_full_name.short_description = "Buyer Name"

    def get_title(self, instance):
        return instance.advertisement.title

    get_title.short_description = "Ad Name"


@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    model = Review

    list_display = (
        "get_full_name",
        "description",
    )

    def get_full_name(self, instance):
        return instance.reviewed_by.user.full_name
