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
