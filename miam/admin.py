from django.contrib import admin

from .models import Advertisement, Order, AdReview, UserReview


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


@admin.register(AdReview)
class AdReviewAdmin(admin.ModelAdmin):
    model = AdReview

    list_display = (
        "get_full_name",
        "description",
    )

    def get_full_name(self, instance):
        return instance.reviewed_by.user.full_name


@admin.register(UserReview)
class UserReviewAdmin(admin.ModelAdmin):
    model = UserReview

    list_display = (
        "get_reviewer_full_name",
        "get_reviewed_full_name",
        "description",
    )

    def get_reviewer_full_name(self, instance):
        return instance.reviewed_by.full_name

    get_reviewer_full_name.short_description = "Reviewed By"

    def get_reviewed_full_name(self, instance):
        return instance.review_of.full_name

    get_reviewed_full_name.short_description = "Review Of"
