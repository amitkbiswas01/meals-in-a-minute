from django.urls import path

from miam.views import (
    HomepageView,
    AdCreateView,
    AdListView,
    AdDetailView,
    AdUpdateView,
    AdDeleteView,
)

urlpatterns = [
    path("", HomepageView.as_view(), name="home"),
    path("createad/", AdCreateView.as_view(), name="createad"),
    path("listad/", AdListView.as_view(), name="listad"),
    path("detailad/<pk>/", AdDetailView.as_view(), name="detailad"),
    path("updatead/<pk>/", AdUpdateView.as_view(), name="updatead"),
    path("deletead/<pk>/", AdDeleteView.as_view(), name="deletead"),
]
