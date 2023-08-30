from django.urls import path

from . views import SafetyCheckView, TrivyCheckView
from . views import CheckovCheckView

urlpatterns = [
    path('safety-check/', SafetyCheckView.as_view(), name='safety_check'),
    path('checkov-check/', CheckovCheckView.as_view(), name='checkov_check'),
    path('trivy-check/', TrivyCheckView.as_view(), name='trivy_check'),
]
