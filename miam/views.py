from urllib.parse import urlencode
from django.http import request
from django.urls import reverse_lazy, reverse
from django.shortcuts import redirect
from django.core.exceptions import ObjectDoesNotExist
from django.views.generic import (
    View,
    TemplateView,
    RedirectView,
    CreateView,
    ListView,
    DetailView,
    UpdateView,
    DeleteView,
)

from accounts.models import SellerProfile, BuyerProfile
from miam.models import Advertisement, Order


class LandingView(TemplateView):
    template_name = "landing_page.html"


class HomepageView(RedirectView):
    """
    Redirects to different homepages according to user type.
    """

    permanent = False

    def get_redirect_url(self, *args, **kwargs):

        if self.request.user.is_authenticated:
            if self.request.user.user_type == "seller":
                return reverse("sellerhome", args=args, kwargs=kwargs)
            elif self.request.user.user_type == "buyer":
                return reverse("listad", args=args, kwargs=kwargs)
            else:
                return reverse("landingpage", args=args, kwargs=kwargs)
        else:
            return reverse("landingpage", args=args, kwargs=kwargs)


class AdListView(ListView):
    """
    List all advertisements.
    """

    model = Advertisement
    fields = [
        "title",
        "price",
        "location",
        "category",
        "description",
        "photo",
        "available_from",
        "available_till",
    ]
    queryset = Advertisement.objects.all()
    context_object_name = "ads"
    paginate_by = 15

    def get_queryset(self):

        locations = [
            "Dhaka",
            "Chattogram",
            "Khulna",
            "Rajshahi",
            "Barisal",
            "Sylhet",
            "Rangpur",
            "Mymensingh",
        ]
        categories = [
            "bengali_food",
            "street_food",
            "sea_food",
            "drinks",
            "sweets",
            "bakery",
        ]
        url = self.request.path_info
        if "/listad/search/" in url:
            keyword = self.kwargs.get("keyword", None)

            if keyword is None:
                return super().get_queryset()

            if keyword in locations:
                return super().get_queryset().filter(location=keyword)
            elif keyword in categories:
                return super().get_queryset().filter(category=keyword)
            else:
                keyword = self.request.GET.get("searched_value", None)
                print(keyword)
                if keyword is not None:
                    return super().get_queryset().filter(title__icontains=keyword)
                else:
                    return super().get_queryset()
        else:
            return super().get_queryset()

    def get_ordering(self):
        sort_type = self.kwargs.get("sort_type", None)

        if sort_type is None:
            order_by = "-available_from"
        else:
            order_by = f"{sort_type}"

        return [order_by]

    def get_template_names(self):
        if self.request.user.user_type == "seller":
            return ["miam/seller_list.html"]
        elif self.request.user.user_type == "buyer":
            return ["miam/buyer_homepage.html"]
        else:
            return ["landing_page.html"]

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and (
            request.user.user_type == "seller" or request.user.user_type == "buyer"
        ):
            return super(AdListView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")


class AdDetailView(DetailView):
    """
    List single advertisement.
    """

    model = Advertisement
    context_object_name = "ad"

    def get_context_data(self, **kwargs):
        context = super(AdDetailView, self).get_context_data(**kwargs)
        context["current_url"] = f"/detailad/{self.kwargs['pk']}"

        order_status = self.kwargs.get("order", None)
        if order_status == "placed":
            context["order"] = "placed"
            print(context)
            return context
        elif order_status == "failed":
            context["order"] = "failed"
            return context
        else:
            return context

    def get_template_names(self):
        if self.request.user.user_type == "seller":
            return ["miam/seller_detailad.html"]
        elif self.request.user.user_type == "buyer":
            return ["miam/buyer_detailad.html"]
        else:
            return ["landing_page.html"]

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and (
            request.user.user_type == "seller" or request.user.user_type == "buyer"
        ):
            return super(AdDetailView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")


class SellerHomepageView(TemplateView):
    template_name = "miam/seller_homepage.html"


class AdCreateView(CreateView):
    """
    Create new advertisement.
    """

    model = Advertisement
    template_name = "miam/create_update.html"
    fields = [
        "title",
        "price",
        "location",
        "category",
        "description",
        "photo",
        "available_till",
    ]
    success_url = reverse_lazy("home")

    def form_valid(self, form):
        form.instance.seller = SellerProfile.objects.get(user=self.request.user)
        return super(AdCreateView, self).form_valid(form)

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user.user_type == "seller":
            return super(AdCreateView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")


class OrderCreateView(View):
    """
    Create new order.
    """

    def post(self, request, *args, **kwargs):

        try:
            buyer = BuyerProfile.objects.get(user=request.user)
            advertisement = Advertisement.objects.get(id=self.kwargs["pk"])
            quantity = request.POST.get("quantity", 1)
            
            Order(buyer=buyer, advertisement=advertisement, quantity=quantity).save()

            url = f"/detailad/{self.kwargs['pk']}/placed"
            return redirect(url)
        except ObjectDoesNotExist:
            url = f"/detailad/{self.kwargs['pk']}/failed"
            return redirect(url)


class AdUpdateView(UpdateView):
    """
    Update existing advertisement.
    """

    model = Advertisement
    template_name = "miam/create_update.html"
    fields = [
        "title",
        "price",
        "location",
        "category",
        "description",
        "photo",
        "available_till",
    ]
    success_url = reverse_lazy("home")

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user.user_type == "seller":
            return super(AdUpdateView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")


class AdDeleteView(DeleteView):
    """
    Delete single advertisement.
    """

    model = Advertisement
    success_url = reverse_lazy("home")

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user.user_type == "seller":
            return super(AdDeleteView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")


class ProfileView(TemplateView):
    template_name = "miam/profile.html"

    def get_context_data(self, **kwargs):
        context = super(ProfileView, self).get_context_data(**kwargs)
        if self.request.user.user_type == "buyer":
            try:
                buyer_profile = BuyerProfile.objects.get(user=self.request.user)
                context["buyer_profile"] = buyer_profile
                context["orders"] = Order.objects.filter(buyer=buyer_profile).order_by(
                    "-created_at"
                )
            except ObjectDoesNotExist:
                return context
        return context
