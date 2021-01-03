from django.urls import path

from miam.views import (
    LandingView,
    HomepageView,
    SellerHomepageView,
    AdCreateView,
    AdListView,
    # SortedAdListView,
    AdDetailView,
    AdUpdateView,
    AdDeleteView,
)

urlpatterns = [
    path("", HomepageView.as_view(), name="home"),
    path("welcome/", LandingView.as_view(), name="landingpage"),
    path("sellerhome/", SellerHomepageView.as_view(), name="sellerhome"),
    path("createad/", AdCreateView.as_view(), name="createad"),
    path("listad/", AdListView.as_view(), name="listad"),
    path("listad/<str:sort_type>/", AdListView.as_view(), name="listad"),
    path("listad/search/<str:keyword>/", AdListView.as_view(), name="search_listad"),
    path("detailad/<uuid:pk>/", AdDetailView.as_view(), name="detailad"),
    path("updatead/<uuid:pk>/", AdUpdateView.as_view(), name="updatead"),
    path("deletead/<uuid:pk>/", AdDeleteView.as_view(), name="deletead"),
]
