from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from accounts.forms import CustomUserCreationForm, CustomUserChangeForm
from accounts.models import User, SellerProfile, BuyerProfile


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
        "phone_no",
        "created_at",
        "user_type",
        "is_staff",
        "is_active",
        "is_superuser",
    )
    list_filter = (
        "user_type",
        "is_staff",
    )

    fieldsets = (
        ("Information", {"fields": ("full_name", "email", "password", "user_type")}),
        (
            "Permission",
            {
                "fields": (
                    "is_staff",
                    "is_active",
                )
            },
        ),
    )

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
                    "user_type",
                    "is_staff",
                    "is_active",
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
        "location",
        "company_name",
        "food_category",
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
            {
                "fields": (
                    "location",
                    "company_name",
                    "food_category",
                )
            },
        ),
    )
    add_fieldsets = (
        (
            "Identification",
            {"fields": ("user",)},
        ),
        (
            "General Information",
            {
                "fields": (
                    "location",
                    "company_name",
                    "food_category",
                )
            },
        ),
    )

    search_fields = (
        "user__full_name",
        "location",
        "company_name",
        "food_category",
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