from django import forms
from allauth.account.forms import SignupForm
from django.core.validators import RegexValidator
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from .models import User, SellerProfile, BuyerProfile


class CustomUserCreationForm(UserCreationForm):
    """
    Custom registration form fo adminsite.
    """

    class Meta(UserCreationForm.Meta):
        model = User
        fields = ["email", "full_name"]


class CustomUserChangeForm(UserChangeForm):
    """
    Custom update form for adminsite.
    """

    class Meta(UserChangeForm.Meta):
        model = User
        fields = ["email", "full_name"]


class SellerSignupForm(SignupForm):
    """
    Custom Signup form for Seller.
    """

    full_name = forms.CharField(label=_("Full Name"), max_length=255, required=True)
    phone_regex = RegexValidator(
        regex=r"^\+(?:[0-9] ?){6,14}[0-9]$", message=_("Invalid Phone Number")
    )
    phone_no = forms.CharField(
        label=_("Phone Number"), validators=[phone_regex], max_length=17, required=True
    )
    DIVISION_CHOICES = [
        ("Dhaka", "Dhaka"),
        ("Chattogram", "Chattogram"),
        ("Khulna", "Khulna"),
        ("Rajshahi", "Rajshahi"),
        ("Barisal", "Barisal"),
        ("Rangpur", "Rangpur"),
        ("Sylhet", "Sylhet"),
        ("Mymensingh", "Mymensingh"),
    ]
    location = forms.ChoiceField(
        label=_("Location"), choices=DIVISION_CHOICES, required=True
    )
    company_name = forms.CharField(
        label=_("Company Name"), max_length=255, required=False
    )
    food_category = forms.CharField(
        label=_("Food Catogory"), max_length=255, required=True
    )

    def custom_signup(self, request, user):
        user.full_name = self.cleaned_data["full_name"]
        user.phone_no = self.cleaned_data["phone_no"]
        user.user_type = "seller"

        user.save()

        SellerProfile(
            user=user,
            location=self.cleaned_data["location"],
            company_name=self.cleaned_data["company_name"],
            food_category=self.cleaned_data["food_category"],
        ).save()


class BuyerSignupForm(SignupForm):
    """
    Custom Signup form for Buyer.
    """

    full_name = forms.CharField(label=_("Full Name"), max_length=255, required=True)
    phone_regex = RegexValidator(
        regex=r"^\+(?:[0-9] ?){6,14}[0-9]$", message=_("Invalid Phone Number")
    )
    phone_no = forms.CharField(
        label=_("Phone Number"), validators=[phone_regex], max_length=17, required=False
    )
    address = forms.CharField(label="Address", max_length=2056, required=True)

    def custom_signup(self, request, user):

        user.full_name = self.cleaned_data["full_name"]
        user.phone_no = self.cleaned_data["phone_no"]
        user.user_type = "buyer"

        user.save()
        BuyerProfile(
            user=user,
            address=self.cleaned_data["address"],
        ).save()