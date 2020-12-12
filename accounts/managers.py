from django.utils.translation import gettext_lazy as _
from django.contrib.auth.base_user import BaseUserManager


class CustomUserManager(BaseUserManager):

    """
    Custom User Model Manager to use Email as unique identifier
    for authentication instead of Username.
    """

    def create_user(self, email, password, full_name, **extra_fields):
        """
        Create and save an User with the given email, password and other fields.
        """
        if not email:
            raise ValueError(_("Email address must be provided."))

        email = self.normalize_email(email)
        user = self.model(email=email, full_name=full_name, **extra_fields)
        user.set_password(password)
        user.save()

        return user

    def create_superuser(self, email, password, full_name, **extra_fields):
        """
        Create and save a Superuser with the given email and password.
        """
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        extra_fields.setdefault("is_active", True)

        if extra_fields.get("is_staff") is not True:
            raise ValueError(_("Superuser must have is_staff=True."))
        if extra_fields.get("is_superuser") is not True:
            raise ValueError(_("Superuser must have is_superuser=True."))

        return self.create_user(email, password, full_name, **extra_fields)
