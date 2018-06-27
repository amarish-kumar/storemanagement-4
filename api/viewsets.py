from rest_framework.viewsets import ModelViewSet
from rest_framework.decorators import permission_classes
from rest_framework.permissions import IsAuthenticated
from .models import Store, StoreBranch, Category, SubCategory, Product, ProductPicture, ProductVariation, OrderedProduct, \
    Order, OrderAddress
from .serializers import StoreSerializer, StoreBranchSerializer, CategorySerializer, SubCategorySerializer, ProductSerializer, \
    ProductPictureSerializer, ProductVariationSerializer, OrderedProductSerializer, OrderSerializer, OrderAddressSerializer

class StoreViewSet(ModelViewSet):
    serializer_class = StoreSerializer
    queryset = Store.objects.all()

class StoreBranchViewSet(ModelViewSet):
    serializer_class = StoreBranchSerializer
    queryset = StoreBranch.objects.all()

class CategoryViewSet(ModelViewSet):
    serializer_class = CategorySerializer
    queryset = Category.objects.all()

class SubCategoryViewSet(ModelViewSet):
    serializer_class = SubCategorySerializer
    queryset = SubCategory.objects.all()

class ProductViewSet(ModelViewSet):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()

class ProductPictureViewSet(ModelViewSet):
    serializer_class = ProductPictureSerializer
    queryset = ProductPicture.objects.all()

class ProductVariationViewSet(ModelViewSet):
    serializer_class = ProductVariationSerializer
    queryset = ProductVariation.objects.all()

@permission_classes((IsAuthenticated,))
class OrderedProductViewSet(ModelViewSet):
    serializer_class = OrderedProductSerializer
    queryset = OrderedProduct.objects.all()

@permission_classes((IsAuthenticated,))
class OrderViewSet(ModelViewSet):
    serializer_class = OrderSerializer
    queryset = Order.objects.all()

@permission_classes((IsAuthenticated,))
class OrderAddressViewSet(ModelViewSet):
    serializer_class = OrderAddressSerializer
    queryset = OrderAddress.objects.all()
