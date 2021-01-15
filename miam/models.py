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
    CATEGORY_CHOICES = (
        ("bengali_food", "Homemade Bengali Food"),
        ("street_food", "Street Food"),
        ("sea_food", "Sea Food"),
        ("drinks", "Drinks and Juices"),
        ("sweets", "Sweets and Pithas"),
        ("bakery", "Cakes and Bakery"),
    )
    category = models.CharField(
        _("Food Category"), max_length=256, choices=CATEGORY_CHOICES
    )
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


class Order(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    buyer = models.ForeignKey(
        "accounts.BuyerProfile", verbose_name=_("Buyer"), on_delete=models.CASCADE
    )
    advertisement = models.ForeignKey(
        "miam.Advertisement", verbose_name=_("Advertisement"), on_delete=models.CASCADE
    )
    quantity = models.IntegerField(_("Quantity"))
    created_at = models.DateTimeField(_("Created at"), auto_now_add=True)

    class Meta:
        verbose_name = _("order")
        verbose_name_plural = _("orders")

    def __str__(self):
        return self.advertisement.title

    def get_absolute_url(self):
        return reverse("order_detail", kwargs={"pk": self.pk})


class Review(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    advertisement_id = models.ForeignKey(
        "miam.Advertisement", verbose_name=_("Advertisement"), on_delete=models.CASCADE
    )
    reviewed_by = models.ForeignKey(
        "accounts.Buyerprofile", verbose_name=_("Reviewed By"), on_delete=models.CASCADE
    )
    created_at = models.DateTimeField(_("Created at"), auto_now_add=True)
    description = models.TextField(_("Review Description"))

    class Meta:
        verbose_name = _("review")
        verbose_name_plural = _("reviews")

    def __str__(self):
        return self.advertisement_id.title

    def get_absolute_url(self):
        return reverse("review_detail", kwargs={"pk": self.pk})
