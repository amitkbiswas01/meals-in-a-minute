from django.urls import reverse_lazy
from django.shortcuts import redirect
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.views.generic import (
    CreateView,
    ListView,
    DetailView,
    UpdateView,
    DeleteView,
)

from accounts.models import SellerProfile
from miam.models import Advertisement, AdReview


class AdCreateView(LoginRequiredMixin, UserPassesTestMixin, CreateView):
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

    def test_func(self):
        return self.request.user.user_type == "seller"

    def handle_no_permission(self):
        return redirect("home")


class AdListView(LoginRequiredMixin, ListView):
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
    paginate_by = 10

    def get_ordering(self):
        sort_type = self.kwargs.get("sort_type", None)

        if sort_type is None:
            order_by = "-available_from"
        else:
            order_by = f"{sort_type}"

        return [order_by]

    def get_queryset(self):
        if self.request.user.user_type == "seller":
            seller = SellerProfile.objects.get(user=self.request.user)
            return super().get_queryset().filter(seller=seller)
        else:
            return super().get_queryset()

    def get_template_names(self):
        if self.request.user.user_type == "seller":
            return ["miam/seller_homepage.html"]
        elif self.request.user.user_type == "buyer":
            return ["miam/buyer_homepage.html"]
        else:
            return ["landing_page.html"]


class AdListSearchView(LoginRequiredMixin, ListView):
    """
    Show searched advertisements.
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
    paginate_by = 10

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

        keyword = self.kwargs.get("keyword", None)

        if keyword is None:
            return super().get_queryset()
        elif keyword in locations:
            return super().get_queryset().filter(location=keyword)
        elif keyword in categories:
            return super().get_queryset().filter(category=keyword)
        else:
            keyword = self.request.GET.get("searched_value", None)
            if keyword is not None:
                if self.request.user.user_type == "seller":
                    seller = SellerProfile.objects.get(user=self.request.user)
                    return (
                        super()
                        .get_queryset()
                        .filter(seller=seller, title__icontains=keyword)
                    )
                else:
                    return super().get_queryset().filter(title__icontains=keyword)
            else:
                return super().get_queryset()

    def get_template_names(self):
        if self.request.user.user_type == "seller":
            return ["miam/seller_homepage.html"]
        elif self.request.user.user_type == "buyer":
            return ["miam/buyer_homepage.html"]
        else:
            return ["landing_page.html"]


class AdDetailView(LoginRequiredMixin, DetailView):
    """
    List single advertisement.
    """

    model = Advertisement
    context_object_name = "ad"

    def get_context_data(self, **kwargs):
        context = super(AdDetailView, self).get_context_data(**kwargs)
        context["current_url"] = f"/detailad/{self.kwargs['pk']}"

        # reviews added to context
        context["reviews"] = AdReview.objects.filter(
            advertisement=self.kwargs["pk"]
        ).order_by("-created_at")

        order_status = self.kwargs.get("order", None)

        if order_status == "placed":
            context["order"] = "placed"

        if order_status == "failed":
            context["order"] = "failed"

        return context

    def get_template_names(self):
        if self.request.user.user_type == "seller":
            return ["miam/seller_detailad.html"]
        elif self.request.user.user_type == "buyer":
            return ["miam/buyer_detailad.html"]
        else:
            return ["landing_page.html"]


class AdUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
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

    def test_func(self):
        return self.request.user.user_type == "seller"

    def handle_no_permission(self):
        return redirect("home")


class AdDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    """
    Delete single advertisement.
    """

    model = Advertisement
    success_url = reverse_lazy("home")

    def test_func(self):
        return self.request.user.user_type == "seller"

    def handle_no_permission(self):
        return redirect("home")
