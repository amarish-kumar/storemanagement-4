from django.urls import path
from django.conf.urls import url, include
from rest_framework.routers import DefaultRouter

app_name = "api"
router = DefaultRouter()
#router.register('account', AccountViewSet)
#router.register('account-type', AccountTypeViewSet)

urlpatterns = [
    url(r'^api-auth/', include('rest_framework.urls')),
] + router.urls