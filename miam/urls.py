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
    PromoCodeCreateView,
    PromoCodeListView,
    PromoCodeDeleteView,
)

url_basic = [
    path("", HomepageView.as_view(), name="home"),
    path("welcome/", LandingView.as_view(), name="landingpage"),
]
url_ads = [
    path("createad/", AdCreateView.as_view(), name="createad"),
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
url_misc = [
    path("createorder/<uuid:pk>", OrderCreateView.as_view(), name="createorder"),
    path("createreview/<uuid:pk>", AdReviewCreateView.as_view(), name="cretereview"),
    path("promocreate/<uuid:pk>", PromoCodeCreateView.as_view(), name="promocreate"),
    path("promocodes/", PromoCodeListView.as_view(), name="promocodes"),
    path("promodelete/<uuid:pk>", PromoCodeDeleteView.as_view(), name="promodelete"),
]

urlpatterns = url_basic + url_ads + url_bookmarks + url_profiles + url_misc
