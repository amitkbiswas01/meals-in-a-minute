from django.urls import path

from accounts.views import SellerSignupView, BuyerSignupView, SignupPageView

urlpatterns = [
    path("", SignupPageView.as_view(), name="account_signup"),
    path("seller/", SellerSignupView.as_view(), name="seller_signup"),
    path("buyer/", BuyerSignupView.as_view(), name="buyer_signup"),
]