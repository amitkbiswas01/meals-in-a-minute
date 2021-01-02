from django.urls import reverse_lazy
from django.shortcuts import redirect
from django.views.generic import (
    TemplateView,
    CreateView,
    ListView,
    DetailView,
    UpdateView,
    DeleteView,
)

from accounts.models import SellerProfile
from miam.models import Advertisement


class HomepageView(TemplateView):
    """
    Checks if logged in and renders homepage accordingly.
    """

    template_name = "miam/buyer_homepage.html"

    def get_template_names(self):
        if self.request.user.is_authenticated:
            if self.request.user.user_type == "seller":
                template_name = "miam/seller_homepage.html"
            else:
                template_name = "miam/buyer_homepage.html"
        else:
            template_name = "landing_page.html"

        return [template_name]


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


class AdListView(ListView):
    """
    List all advertisements.
    """

    model = Advertisement
    template_name = "miam/seller_list.html"
    fields = [
        "title",
        "price",
        "location",
        "category",
        "available_till",
    ]
    queryset = Advertisement.objects.all()
    context_object_name = "ads"
    paginate_by = 10

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user.user_type == "seller":
            return super(AdListView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")


class AdDetailView(DetailView):
    """
    List single advertisement.
    """

    model = Advertisement
    template_name = "miam/seller_detail.html"
    context_object_name = "ad"

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user.user_type == "seller":
            return super(AdDetailView, self).dispatch(request, *args, **kwargs)
        else:
            return redirect("home")


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
