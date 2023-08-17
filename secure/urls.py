from django.urls import path

from . views import SafetyCheckView
from . views import CheckovCheckView

urlpatterns = [
    path('safety-check/', SafetyCheckView.as_view(), name='safety_check'),
    path('checkov-check/', CheckovCheckView.as_view(), name='checkov_check'),
]
