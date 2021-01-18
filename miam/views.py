from django.urls import reverse_lazy, reverse
from django.shortcuts import redirect
from django.core.exceptions import ObjectDoesNotExist
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
    template_name = "landing_page.html"


class HomepageView(RedirectView):
    """
    Redirects to different homepages according to user type.
    """

    permanent = False

    def get_redirect_url(self, *args, **kwargs):

        if self.request.user.is_authenticated:
            return reverse("listad", args=args, kwargs=kwargs)
        else:
            return reverse("landingpage", args=args, kwargs=kwargs)


class OrderCreateView(View):
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
                promocode = PromoCode.objects.get(name=promocode)
                total_price = total_price - ((total_price * promocode.percentage) / 100)
                Order(
                    buyer=buyer,
                    advertisement=advertisement,
                    quantity=quantity,
                    total_price=total_price,
                ).save()
            except:
                Order(
                    buyer=buyer,
                    advertisement=advertisement,
                    quantity=quantity,
                    total_price=total_price,
                ).save()

            url = f"/detailad/{self.kwargs['pk']}/placed"
            return redirect(url)
        except ObjectDoesNotExist:
            url = f"/detailad/{self.kwargs['pk']}/failed"
            return redirect(url)


class AdBookmarkCreateView(View):
    model = AdBookmark

    def get(self, request, *args, **kwargs):
        advertisement_id = Advertisement.objects.get(id=self.kwargs.get("pk"))
        buyer = BuyerProfile.objects.get(user=request.user)
        AdBookmark(bookmarked_by=buyer, advertisement_id=advertisement_id).save()

        return redirect(request.get_full_path)


class AdBookmarkListView(ListView):
    """
    List all bookmarked advertisements.
    """

    model = AdBookmark
    fields = [
        "bookmarked_by",
        "advertisement_id",
    ]
    queryset = AdBookmark.objects.all()
    context_object_name = "ads"
    paginate_by = 15

    def get_queryset(self):
        buyer = BuyerProfile.objects.get(user=self.request.user)
        return AdBookmark.objects.filter(bookmarked_by=buyer)

    def get_template_names(self):
        if self.request.user.user_type == "buyer":
            return ["miam/buyer_bookmarks.html"]
        else:
            return redirect("home")

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and (
            request.user.user_type == "seller" or request.user.user_type == "buyer"
        ):
            return super(AdBookmarkListView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")


class AdBookmarkDeleteView(DeleteView):
    """
    Delete single bookmark.
    """

    model = AdBookmark
    success_url = reverse_lazy("bookmarks")

    def get(self, *args, **kwargs):
        return self.post(*args, **kwargs)

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user.user_type == "buyer":
            return super(AdBookmarkDeleteView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")


class ProfileView(TemplateView):
    template_name = "miam/profile.html"

    def get_context_data(self, **kwargs):
        context = super(ProfileView, self).get_context_data(**kwargs)
        try:
            # checks if logged in user cheking own profile or other profile
            other_profile_id = self.kwargs.get("pk", None)

            # own profile
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


class AdReviewCreateView(CreateView):
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
                advertisement_id=advertisement,
                description=description,
            ).save()

            url = f"/detailad/{self.kwargs['pk']}"
            return redirect(url)
        except ObjectDoesNotExist:
            url = f"/detailad/{self.kwargs['pk']}"
            return redirect(url)


class UserReviewCreateView(CreateView):
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

            url = f"/detailprofile/{self.kwargs['pk']}"
            return redirect(url)
        except ObjectDoesNotExist:
            url = f"/detailprofile/{self.kwargs['pk']}"
            return redirect(url)


class PromoCodeCreateView(CreateView):
    model = PromoCode

    template_name = "miam/create_promocode.html"
    fields = [
        "name",
        "percentage",
    ]
    success_url = reverse_lazy("home")

    def form_valid(self, form):
        form.instance.advertisement = Advertisement.objects.get(id=self.kwargs["pk"])
        return super(PromoCodeCreateView, self).form_valid(form)

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user.user_type == "seller":
            return super(PromoCodeCreateView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")


class PromoCodeListView(ListView):
    """
    List all Promo Codes.
    """

    model = PromoCode
    fields = [
        "name",
        "percentage",
        "created_at",
    ]
    queryset = PromoCode.objects.all()
    context_object_name = "promos"
    paginate_by = 15

    def get_template_names(self):
        if self.request.user.user_type == "seller":
            return ["miam/promocode_list.html"]
        else:
            return redirect("home")

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and (
            request.user.user_type == "seller" or request.user.user_type == "buyer"
        ):
            return super(PromoCodeListView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")


class PromoCodeDeleteView(DeleteView):
    """
    Delete single promo.
    """

    model = PromoCode
    success_url = reverse_lazy("promocodes")

    def get(self, *args, **kwargs):
        return self.post(*args, **kwargs)

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user.user_type == "seller":
            return super(PromoCodeDeleteView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")