import uuid
from django.db import models
from django.urls import reverse
from django.utils.translation import gettext_lazy as _


class Advertisement(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    seller = models.ForeignKey(
        "accounts.SellerProfile", verbose_name=_("Seller"), on_delete=models.CASCADE
    )

    title = models.CharField(_("Title"), max_length=1024)
    price = models.IntegerField(_("Price"))
    DIVISION_CHOICES = (
        ("Dhaka", "Dhaka"),
        ("Chattogram", "Chattogram"),
        ("Khulna", "Khulna"),
        ("Rajshahi", "Rajshahi"),
        ("Barisal", "Barisal"),
        ("Rangpur", "Rangpur"),
        ("Sylhet", "Sylhet"),
        ("Mymensingh", "Mymensingh"),
    )
    location = models.CharField(_("Location"), max_length=255, choices=DIVISION_CHOICES)
    category = models.CharField(_("Food Category"), max_length=512)
    description = models.TextField(_("Description"))
    photo = models.ImageField(_("Photo"), upload_to="ads")
    available_from = models.DateTimeField(_("Available from"), auto_now_add=True)
    available_till = models.DateTimeField(_("Available till"))

    class Meta:
        verbose_name = _("advertisement")
        verbose_name_plural = _("advertisements")

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse("advertisement_detail", kwargs={"pk": self.pk})
