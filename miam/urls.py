from django.urls import path

from miam.views import (
    # advertisement views
    AdCreateView,
    AdListView,
    AdListSearchView,
    AdDetailView,
    AdUpdateView,
    AdDeleteView,
    # review views
    AdReviewCreateView,
    UserReviewCreateView,
    # bookmark views
    AdBookmarkListView,
    AdBookmarkCreateView,
    AdBookmarkDeleteView,
    # promocode views
    PromoCodeCreateView,
    PromoCodeListView,
    PromoCodeDeleteView,
    # misc views
    LandingView,
    HomepageView,
    ProfileView,
    OrderCreateView,
)

url_misc = [
    path("", HomepageView.as_view(), name="home"),
    path("welcome/", LandingView.as_view(), name="landingpage"),
    path("createorder/<uuid:pk>", OrderCreateView.as_view(), name="createorder"),
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
url_reviews = [
    path(
        "createuserreview/<uuid:pk>",
        UserReviewCreateView.as_view(),
        name="create_userreview",
    ),
    path("createreview/<uuid:pk>", AdReviewCreateView.as_view(), name="cretereview"),
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
]
url_promos = [
    path("promocreate/<uuid:pk>", PromoCodeCreateView.as_view(), name="promocreate"),
    path("promocodes/", PromoCodeListView.as_view(), name="promocodes"),
    path("promodelete/<uuid:pk>", PromoCodeDeleteView.as_view(), name="promodelete"),
]

urlpatterns = (
    url_misc + url_ads + url_reviews + url_bookmarks + url_profiles + url_promos
)
