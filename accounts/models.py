import uuid
from django.db import models
from django.urls import reverse
from django.core.validators import RegexValidator
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin

from .managers import CustomUserManager


class User(AbstractBaseUser, PermissionsMixin):
    """
    Override default Django User model.
    """

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    email = models.EmailField(_("Email"), max_length=255, unique=True)
    full_name = models.CharField(_("Name"), max_length=255)
    created_at = models.DateTimeField(_("Joined"), auto_now_add=True)

    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)

    is_seller = models.BooleanField(_("Is Seller"), default=False)
    is_buyer = models.BooleanField(_("Is Buyer"), default=False)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["full_name"]

    objects = CustomUserManager()

    class Meta:
        verbose_name = _("User")
        verbose_name_plural = _("Users")

    def __str__(self):
        return self.email

    def get_absolute_url(self):
        return reverse("_detail", kwargs={"pk": self.pk})


class SellerProfile(models.Model):
    """
    Seller profile to add seller specific fields.
    """

    user = models.OneToOneField(
        "accounts.User",
        verbose_name=_("User"),
        on_delete=models.CASCADE,
        primary_key=True,
    )

    phone_regex = RegexValidator(
        regex=r"^\+(?:[0-9] ?){6,14}[0-9]$",
        message=_("Invalid Phone Number"),
    )
    phone_no = models.CharField(validators=[phone_regex], max_length=17, blank=True)

    location = models.TextField(_("Location"), blank=True)
    company_name = models.CharField(_("Company Name"), max_length=255, blank=True)
    food_type = models.CharField(_("Food type"), max_length=255, blank=True)

    class Meta:
        verbose_name = _("Seller Profile")
        verbose_name_plural = _("Seller Profiles")

    def __str__(self):
        return self.user.email

    def get_absolute_url(self):
        return reverse("sellerprofile_detail", kwargs={"pk": self.pk})


class BuyerProfile(models.Model):

    user = models.OneToOneField(
        "accounts.User",
        verbose_name=_("User"),
        on_delete=models.CASCADE,
        primary_key=True,
    )
    address = models.TextField(_("Address"), blank=True)

    class Meta:
        verbose_name = _("Buyer Profile")
        verbose_name_plural = _("Buyer Profiles")

    def __str__(self):
        return self.user.email

    def get_absolute_url(self):
        return reverse("buyerprofile_detail", kwargs={"pk": self.pk})