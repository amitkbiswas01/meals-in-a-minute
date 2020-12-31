from django.shortcuts import render
from django.views.generic import TemplateView


class HomepageView(TemplateView):
    """
    Checks if logged in and renders homepage accordingly.
    """

    template_name = "homepage.html"

    def get_template_names(self):
        if self.request.user.is_authenticated:
            template_name = "homepage.html"
        else:
            template_name = "landingpage.html"

        return [template_name]
