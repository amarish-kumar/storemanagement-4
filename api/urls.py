from django.conf.urls import url, include
from rest_framework.routers import DefaultRouter
from .viewsets import StoreViewSet, StoreBranchViewSet, CategoryViewSet, SubCategoryViewSet, ProductViewSet, ProductPictureViewSet, \
    ProductVariationViewSet, OrderedProductViewSet, OrderViewSet, OrderAddressViewSet

app_name = "api"

router = DefaultRouter()
router.register('store', StoreViewSet)
router.register('store-branch', StoreBranchViewSet)
router.register('category', CategoryViewSet)
router.register('sub-category', SubCategoryViewSet)
router.register('product', ProductViewSet)
router.register('product-picture', ProductPictureViewSet)
router.register('product-variation', ProductVariationViewSet)
router.register('ordered-product', OrderedProductViewSet)
router.register('order', OrderViewSet)
router.register('order-address', OrderAddressViewSet)

urlpatterns = [
    url(r'^api-auth/', include('rest_framework.urls')),
] + router.urls