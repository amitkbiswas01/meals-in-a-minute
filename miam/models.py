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
        verbose_name = _("Advertisement")
        verbose_name_plural = _("Advertisements")

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
    total_price = models.IntegerField(_("Total Price"))
    is_delivered = models.BooleanField(_("Is Delivered"), default=False)
    created_at = models.DateTimeField(_("Created at"), auto_now_add=True)

    class Meta:
        verbose_name = _("Order")
        verbose_name_plural = _("Orders")

    def __str__(self):
        return self.advertisement.title

    def get_absolute_url(self):
        return reverse("order_detail", kwargs={"pk": self.pk})


class AdReview(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    advertisement = models.ForeignKey(
        "miam.Advertisement", verbose_name=_("Advertisement"), on_delete=models.CASCADE
    )
    reviewed_by = models.ForeignKey(
        "accounts.BuyerProfile",
        verbose_name=_("Reviewed By"),
        on_delete=models.CASCADE,
    )
    description = models.TextField(_("Review Description"))
    created_at = models.DateTimeField(_("Created at"), auto_now_add=True)

    class Meta:
        verbose_name = _("Advertisement Review")
        verbose_name_plural = _("Advertisement Reviews")

    def __str__(self):
        return self.advertisement.title

    def get_absolute_url(self):
        return reverse("adreview_detail", kwargs={"pk": self.pk})


class UserReview(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    reviewed_by = models.ForeignKey(
        "accounts.User",
        verbose_name=_("Reviewed By"),
        related_name="reviewedby",
        on_delete=models.CASCADE,
    )
    review_of = models.ForeignKey(
        "accounts.User",
        verbose_name=_("Review Of"),
        related_name="reviewof",
        on_delete=models.CASCADE,
    )
    description = models.TextField(_("Review Description"))
    created_at = models.DateTimeField(_("Created at"), auto_now_add=True)

    class Meta:
        verbose_name = _("User Review")
        verbose_name_plural = _("User Reviews")

    def __str__(self):
        return self.created_at.strftime("%m/%d/%Y, %H:%M:%S")

    def get_absolute_url(self):
        return reverse("userreview_detail", kwargs={"pk": self.pk})


class AdBookmark(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    advertisement = models.ForeignKey(
        "miam.Advertisement", verbose_name=_("Advertisement"), on_delete=models.CASCADE
    )
    bookmarked_by = models.ForeignKey(
        "accounts.BuyerProfile",
        verbose_name=_("Reviewed By"),
        on_delete=models.CASCADE,
    )
    created_at = models.DateTimeField(_("Created at"), auto_now_add=True)

    class Meta:
        verbose_name = _("Advertisement Bookmark")
        verbose_name_plural = _("Advertisement Bookmarks")

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse("adbookmark_detail", kwargs={"pk": self.pk})


class PromoCode(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    seller = models.ForeignKey(
        "accounts.SellerProfile", verbose_name=_("Seller"), on_delete=models.CASCADE
    )
    advertisement = models.ForeignKey(
        "miam.Advertisement", verbose_name=_("Advertisement"), on_delete=models.CASCADE
    )
    name = models.CharField(_("Code Name"), max_length=50)
    percentage = models.IntegerField(_("Percentage"))
    created_at = models.DateTimeField(_("Created at"), auto_now_add=True)

    class Meta:
        verbose_name = _("Promo Code")
        verbose_name_plural = _("Promo Codes")

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse("promocode_detail", kwargs={"pk": self.pk})
