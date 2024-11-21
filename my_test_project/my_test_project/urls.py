
from django.contrib import admin
from django.urls import path

from app.views import OrderView, UserView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('users/', UserView.as_view(), name='users'),
    path('orders/', OrderView.as_view(), name='orders'),
    path('', OrderView.as_view(), name='home'),
]
