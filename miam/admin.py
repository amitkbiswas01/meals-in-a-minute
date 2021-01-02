from django.contrib import admin

from .models import Advertisement


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