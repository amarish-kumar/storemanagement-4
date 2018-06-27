from rest_framework.serializers import ModelSerializer
from .models import Store, StoreBranch, Category, SubCategory, Product, ProductPicture, ProductVariation, OrderedProduct, Order, OrderAddress

class StoreSerializer(ModelSerializer):
    class Meta:
        model = Store
        fields = '__all__'

class StoreBranchSerializer(ModelSerializer):
    class Meta:
        model = StoreBranch
        fields = '__all__'

class CategorySerializer(ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'

class SubCategorySerializer(ModelSerializer):
    class Meta:
        model = SubCategory
        fields = '__all__'

class ProductSerializer(ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'

class ProductPictureSerializer(ModelSerializer):
    class Meta:
        model = ProductPicture
        fields = '__all__'

class ProductVariationSerializer(ModelSerializer):
    class Meta:
        model = ProductVariation
        fields = '__all__'

class OrderedProductSerializer(ModelSerializer):
    class Meta:
        model = OrderedProduct
        fields = '__all__'

class OrderSerializer(ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'

class OrderAddressSerializer(ModelSerializer):
    class Meta:
        model = OrderAddress
        fields = '__all__'
