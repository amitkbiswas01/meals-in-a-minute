from django.contrib import admin

from miam.models import (
    Advertisement,
    Order,
    AdReview,
    UserReview,
    AdBookmark,
    PromoCode,
)


@admin.register(Advertisement)
class AdvertisementAdmin(admin.ModelAdmin):
    model = Advertisement

    list_display = (
        "get_company_name",
        "title",
        "price",
        "location",
        "category",
        "description",
        "photo",
        "available_till",
    )

    def get_company_name(self, instance):
        return instance.seller.company_name

    get_company_name.short_description = "Company Name"


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    model = Order

    list_display = (
        "get_full_name",
        "get_title",
        "quantity",
        "total_price",
        "is_delivered",
        "created_at",
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
        "get_title",
        "created_at",
        "description",
    )

    def get_full_name(self, instance):
        return instance.reviewed_by.user.full_name

    get_full_name.short_description = "Reviewer"

    def get_title(self, instance):
        return instance.advertisement.title

    get_title.short_description = "Advertisement Title"


@admin.register(UserReview)
class UserReviewAdmin(admin.ModelAdmin):
    model = UserReview

    list_display = (
        "get_reviewer_full_name",
        "get_reviewed_full_name",
        "description",
        "created_at",
    )

    def get_reviewer_full_name(self, instance):
        return instance.reviewed_by.full_name

    get_reviewer_full_name.short_description = "Reviewed By"

    def get_reviewed_full_name(self, instance):
        return instance.review_of.full_name

    get_reviewed_full_name.short_description = "Review Of"


@admin.register(AdBookmark)
class AdBookmarkAdmin(admin.ModelAdmin):
    model = AdBookmark

    list_display = (
        "get_title",
        "get_buyer_full_name",
        "created_at",
    )

    def get_title(self, instance):
        return instance.advertisement.title

    get_title.short_description = "Advertisement Title"

    def get_buyer_full_name(self, instance):
        return instance.bookmarked_by.user.full_name

    get_buyer_full_name.short_description = "Bookmarked By"


@admin.register(PromoCode)
class PromoCodeAdmin(admin.ModelAdmin):
    model = PromoCode

    list_display = (
        "get_title",
        "name",
        "percentage",
        "created_at",
    )

    def get_title(self, instance):
        return instance.advertisement.title

    get_title.short_description = "Advertisement Title"
