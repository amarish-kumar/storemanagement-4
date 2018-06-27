from django.contrib import admin
from .models import Store, StoreBranch, Category, SubCategory, Product, ProductPicture, ProductVariation, OrderedProduct, \
    Order, OrderAddress

# Register your models here.

admin.site.register(Store)
admin.site.register(StoreBranch)
admin.site.register(Category)
admin.site.register(SubCategory)
admin.site.register(Product)
admin.site.register(ProductPicture)
admin.site.register(ProductVariation)
admin.site.register(OrderedProduct)
admin.site.register(Order)
admin.site.register(OrderAddress)