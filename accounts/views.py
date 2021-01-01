from django.shortcuts import render, redirect
from django.views.generic import TemplateView, RedirectView
from allauth.account.views import SignupView

from .forms import SellerSignupForm, BuyerSignupForm


class SignupPageView(TemplateView):
    template_name = "signup_select.html"

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            return redirect("home")
        return super(SignupPageView, self).dispatch(request, *args, **kwargs)


class SellerSignupView(SignupView):
    template_name = "account/signup.html"
    form_class = SellerSignupForm

    def get_context_data(self, **kwargs):
        context = super(SellerSignupView, self).get_context_data(**kwargs)
        context["is_seller"] = True
        return context


class BuyerSignupView(SignupView):
    template_name = "account/signup.html"
    form_class = BuyerSignupForm

    def get_context_data(self, **kwargs):
        context = super(BuyerSignupView, self).get_context_data(**kwargs)
        context["is_seller"] = False
        return context
