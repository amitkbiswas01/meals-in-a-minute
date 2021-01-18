from django.urls import path

from miam.views import (
    LandingView,
    HomepageView,
    # ad views
    AdCreateView,
    OrderCreateView,
    AdListView,
    AdListSearchView,
    AdDetailView,
    AdUpdateView,
    AdDeleteView,
    AdReviewCreateView,
    # profile views
    ProfileView,
    UserReviewCreateView,
    AdBookmarkListView,
    AdBookmarkCreateView,
    AdBookmarkDeleteView,
)

url_misc = [
    path("", HomepageView.as_view(), name="home"),
    path("welcome/", LandingView.as_view(), name="landingpage"),
]
url_ads = [
    path("createad/", AdCreateView.as_view(), name="createad"),
    path("createorder/<uuid:pk>", OrderCreateView.as_view(), name="createorder"),
    path("createreview/<uuid:pk>", AdReviewCreateView.as_view(), name="cretereview"),
    path("listad/", AdListView.as_view(), name="listad"),
    path("listad/<str:sort_type>/", AdListView.as_view(), name="listad"),
    path(
        "listad/search/<str:keyword>/", AdListSearchView.as_view(), name="search_listad"
    ),
    path("detailad/<uuid:pk>/", AdDetailView.as_view(), name="detailad"),
    path("detailad/<uuid:pk>/<str:order>/", AdDetailView.as_view(), name="detailad"),
    path("updatead/<uuid:pk>/", AdUpdateView.as_view(), name="updatead"),
    path("deletead/<uuid:pk>/", AdDeleteView.as_view(), name="deletead"),
]
url_bookmarks = [
    path("bookmarks/", AdBookmarkListView.as_view(), name="bookmarks"),
    path("adbookmark/<uuid:pk>/", AdBookmarkCreateView.as_view(), name="adbookmark"),
    path(
        "adbookmarkdelete/<uuid:pk>/",
        AdBookmarkDeleteView.as_view(),
        name="adbookmarkdelete",
    ),
]
url_profiles = [
    path("detailprofile/", ProfileView.as_view(), name="profile"),
    path("detailprofile/<uuid:pk>", ProfileView.as_view(), name="otherprofile"),
    path(
        "createuserreview/<uuid:pk>",
        UserReviewCreateView.as_view(),
        name="create_userreview",
    ),
]

urlpatterns = url_misc + url_ads + url_bookmarks + url_profiles
