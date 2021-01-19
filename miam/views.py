from django.shortcuts import redirect
from django.urls import reverse_lazy, reverse
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin

from django.views.generic import (
    View,
    TemplateView,
    RedirectView,
    CreateView,
    ListView,
    DeleteView,
)

from miam.ad_view import *
from accounts.models import SellerProfile, BuyerProfile, User
from miam.models import (
    Advertisement,
    Order,
    AdReview,
    UserReview,
    AdBookmark,
    PromoCode,
)


class LandingView(TemplateView):
    """
    Landing Page View.
    """

    template_name = "landing_page.html"


class HomepageView(RedirectView):
    """
    Redirects to according to authentication.
    """

    permanent = False

    def get_redirect_url(self, *args, **kwargs):

        if self.request.user.is_authenticated:
            return reverse("listad", args=args, kwargs=kwargs)
        else:
            return reverse("landingpage", args=args, kwargs=kwargs)


class ProfileView(LoginRequiredMixin, TemplateView):
    template_name = "miam/profile.html"

    def get_context_data(self, **kwargs):
        context = super(ProfileView, self).get_context_data(**kwargs)
        try:
            # checks if logged in user cheking own profile or other profile
            other_profile_id = self.kwargs.get("pk", None)

            # if own profile
            if other_profile_id is None:
                if self.request.user.user_type == "buyer":
                    buyer_profile = BuyerProfile.objects.get(user=self.request.user)

                    context["user_type"] = "buyer"
                    context["own_profile"] = True
                    context["buyer_profile"] = buyer_profile

                    context["orders"] = Order.objects.filter(
                        buyer=buyer_profile
                    ).order_by("-created_at")
                    context["reviews"] = UserReview.objects.filter(
                        review_of=self.request.user
                    ).order_by("-created_at")

                elif self.request.user.user_type == "seller":
                    seller_profile = SellerProfile.objects.get(user=self.request.user)

                    context["user_type"] = "seller"
                    context["own_profile"] = True
                    context["seller_profile"] = seller_profile

                    context["orders"] = Order.objects.filter(
                        advertisement__seller=seller_profile
                    ).order_by("-created_at")
                    context["reviews"] = UserReview.objects.filter(
                        review_of=self.request.user
                    ).order_by("-created_at")
                else:
                    return redirect("home")

                return context
            else:
                # if visiting others profile
                user = User.objects.get(id=other_profile_id)
                if self.request.user.user_type == "buyer":
                    seller_profile = SellerProfile.objects.get(user=user)

                    context["user_type"] = "seller"
                    context["own_profile"] = False
                    context["seller_profile"] = seller_profile

                    context["reviews"] = UserReview.objects.filter(
                        review_of=user
                    ).order_by("-created_at")

                elif self.request.user.user_type == "seller":

                    buyer_profile = BuyerProfile.objects.get(user=user)

                    context["user_type"] = "buyer"
                    context["own_profile"] = False
                    context["buyer_profile"] = buyer_profile

                    context["reviews"] = UserReview.objects.filter(
                        review_of=user
                    ).order_by("-created_at")
                else:
                    return redirect("home")

                return context
        except ObjectDoesNotExist:
            return context


class OrderCreateView(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    """
    Create new order.
    """

    def post(self, request, *args, **kwargs):

        try:
            buyer = BuyerProfile.objects.get(user=request.user)
            advertisement = Advertisement.objects.get(id=self.kwargs["pk"])
            quantity = request.POST.get("quantity")
            promocode = request.POST.get("promocode")

            total_price = advertisement.price * int(quantity)

            try:
                promocode = PromoCode.objects.get(
                    name=promocode, advertisement=advertisement
                )
                total_price = total_price - ((total_price * promocode.percentage) / 100)
                Order(
                    buyer=buyer,
                    advertisement=advertisement,
                    quantity=quantity,
                    total_price=total_price,
                ).save()
                return redirect(f"/detailad/{self.kwargs['pk']}/placed")
            except:
                Order(
                    buyer=buyer,
                    advertisement=advertisement,
                    quantity=quantity,
                    total_price=total_price,
                ).save()
                return redirect(f"/detailad/{self.kwargs['pk']}/placed")
        except ObjectDoesNotExist:
            return redirect(f"/detailad/{self.kwargs['pk']}/failed")

    def test_func(self):
        return self.request.user.user_type == "buyer"

    def handle_no_permission(self):
        return redirect("home")


class OrderUpdateView(LoginRequiredMixin, UserPassesTestMixin, View):
    """
    Update order delivery status.
    """

    def get(self, request, *args, **kwargs):
        order = Order.objects.get(id=self.kwargs.get("pk"))
        order.is_delivered = True
        order.save()

        return redirect("profile")

    def test_func(self):
        return self.request.user.user_type == "seller"

    def handle_no_permission(self):
        return redirect("home")


class AdBookmarkCreateView(LoginRequiredMixin, UserPassesTestMixin, View):
    """
    Create advertisement bookmark.
    """

    model = AdBookmark

    def get(self, request, *args, **kwargs):
        advertisement = Advertisement.objects.get(id=self.kwargs.get("pk"))
        buyer = BuyerProfile.objects.get(user=request.user)
        AdBookmark(bookmarked_by=buyer, advertisement=advertisement).save()

        return redirect("bookmarks")

    def test_func(self):
        return self.request.user.user_type == "buyer"

    def handle_no_permission(self):
        return redirect("home")


class AdBookmarkListView(LoginRequiredMixin, UserPassesTestMixin, ListView):
    """
    List all bookmarked advertisements.
    """

    model = AdBookmark
    fields = [
        "bookmarked_by",
        "advertisement",
    ]
    template_name = "miam/buyer_bookmarks.html"
    queryset = AdBookmark.objects.all()
    context_object_name = "ads"
    paginate_by = 10

    def get_queryset(self):
        buyer = BuyerProfile.objects.get(user=self.request.user)
        return super().get_queryset().filter(bookmarked_by=buyer)

    def test_func(self):
        return self.request.user.user_type == "buyer"

    def handle_no_permission(self):
        return redirect("home")


class AdBookmarkDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    """
    Delete single bookmark.
    """

    model = AdBookmark
    success_url = reverse_lazy("bookmarks")

    def get(self, *args, **kwargs):
        return self.post(*args, **kwargs)

    def test_func(self):
        return self.request.user.user_type == "buyer"

    def handle_no_permission(self):
        return redirect("home")


class AdReviewCreateView(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    """
    Create new review.
    """

    model = AdReview

    def post(self, request, *args, **kwargs):
        try:
            buyer = BuyerProfile.objects.get(user=request.user)
            advertisement = Advertisement.objects.get(id=self.kwargs["pk"])
            description = request.POST.get("description")

            AdReview(
                reviewed_by=buyer,
                advertisement=advertisement,
                description=description,
            ).save()

            return redirect(f"/detailad/{self.kwargs['pk']}")
        except ObjectDoesNotExist:
            return redirect(f"/detailad/{self.kwargs['pk']}")

    def test_func(self):
        return self.request.user.user_type == "buyer"

    def handle_no_permission(self):
        return redirect("home")


class UserReviewCreateView(LoginRequiredMixin, CreateView):
    model = UserReview

    def post(self, request, *args, **kwargs):
        try:
            reviewed_by = request.user
            review_of = User.objects.get(id=self.kwargs["pk"])
            description = request.POST.get("description")

            UserReview(
                reviewed_by=reviewed_by,
                review_of=review_of,
                description=description,
            ).save()

            return redirect(f"/detailprofile/{self.kwargs['pk']}")
        except ObjectDoesNotExist:
            return redirect(f"/detailprofile/{self.kwargs['pk']}")


class PromoCodeCreateView(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    model = PromoCode

    template_name = "miam/create_promocode.html"
    fields = [
        "name",
        "percentage",
    ]
    success_url = reverse_lazy("home")

    def form_valid(self, form):
        form.instance.seller = SellerProfile.objects.get(user=self.request.user)
        form.instance.advertisement = Advertisement.objects.get(id=self.kwargs["pk"])
        return super(PromoCodeCreateView, self).form_valid(form)

    def test_func(self):
        return self.request.user.user_type == "seller"

    def handle_no_permission(self):
        return redirect("home")


class PromoCodeListView(LoginRequiredMixin, UserPassesTestMixin, ListView):
    """
    List all Promo Codes.
    """

    model = PromoCode
    fields = [
        "name",
        "percentage",
        "created_at",
    ]
    template_name = "miam/promocode_list.html"
    queryset = PromoCode.objects.all()
    context_object_name = "promos"
    paginate_by = 10

    def get_queryset(self):
        seller = SellerProfile.objects.get(user=self.request.user)
        return super().get_queryset().filter(seller=seller)

    def test_func(self):
        return self.request.user.user_type == "seller"

    def handle_no_permission(self):
        return redirect("home")


class PromoCodeDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    """
    Delete single promo.
    """

    model = PromoCode
    success_url = reverse_lazy("promocodes")

    def get(self, *args, **kwargs):
        return self.post(*args, **kwargs)

    def test_func(self):
        return self.request.user.user_type == "seller"

    def handle_no_permission(self):
        return redirect("home")