from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .forms import CustomUserCreationForm, CustomUserChangeForm
from .models import User, SellerProfile, BuyerProfile


@admin.register(User)
class CustomUserAdmin(UserAdmin):
    """
    Admin config for User in AdminSite. Includes superuser, staff and regular user.
    """

    model = User
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm

    list_display = (
        "full_name",
        "email",
        "created_at",
        "is_staff",
        "is_active",
        "is_superuser",
        "is_seller",
        "is_buyer",
    )
    list_filter = (
        "is_staff",
        "is_active",
        "is_seller",
        "is_buyer",
    )

    """CustomUserChangeForm fields"""
    fieldsets = (
        ("Information", {"fields": ("full_name", "email", "password")}),
        (
            "Permission",
            {
                "fields": (
                    "is_staff",
                    "is_active",
                    "is_seller",
                    "is_buyer",
                )
            },
        ),
    )
    """CustomUserCreationForm fields"""
    add_fieldsets = (
        (
            "Information",
            {
                "classes": ("wide",),
                "fields": (
                    "full_name",
                    "email",
                    "password1",
                    "password2",
                    "is_staff",
                    "is_active",
                    "is_seller",
                    "is_buyer",
                ),
            },
        ),
    )
    search_fields = (
        "full_name",
        "email",
    )
    ordering = [
        "-created_at",
    ]


@admin.register(SellerProfile)
class SellerProfileAdmin(admin.ModelAdmin):
    """
    Seller Profile in adminsite. Only shows users who are also sellers.
    """

    model = SellerProfile

    list_display = (
        "get_full_name",
        "phone_no",
        "location",
        "company_name",
        "food_type",
    )

    def get_full_name(self, instance):
        return instance.user.full_name

    get_full_name.short_description = "Full Name"

    fieldsets = (
        (
            "Identification",
            {
                "fields": (
                    "user",
                    "phone_no",
                )
            },
        ),
        (
            "General Information",
            {
                "fields": (
                    "location",
                    "company_name",
                    "food_type",
                )
            },
        ),
    )
    add_fieldsets = (
        (
            "Identification",
            {
                "fields": (
                    "user",
                    "phone_no",
                )
            },
        ),
        (
            "General Information",
            {
                "fields": (
                    "location",
                    "company_name",
                    "food_type",
                )
            },
        ),
    )

    search_fields = (
        "user__full_name",
        "location",
        "company_name",
        "food_type",
    )

    ordering = [
        "-user__created_at",
    ]


@admin.register(BuyerProfile)
class BuyerProfileAdmin(admin.ModelAdmin):
    """
    Seller Profile in adminsite. Only shows users who are also sellers.
    """

    model = BuyerProfile

    list_display = (
        "get_full_name",
        "address",
    )

    def get_full_name(self, instance):
        return instance.user.full_name

    get_full_name.short_description = "Full Name"

    fieldsets = (
        (
            "Identification",
            {"fields": ("user",)},
        ),
        (
            "General Information",
            {"fields": ("address",)},
        ),
    )
    add_fieldsets = (
        (
            "Identification",
            {"fields": ("user",)},
        ),
        (
            "General Information",
            {"fields": ("address",)},
        ),
    )

    search_fields = (
        "user__full_name",
        "address",
    )

    ordering = [
        "-user__created_at",
    ]