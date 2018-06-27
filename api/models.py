from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Store(models.Model):
    name = models.CharField(max_length=55)
    description = models.TextField()
    website = models.CharField(max_length=255)
    fb_url = models.CharField(max_length=255, null=True, blank=True)
    main_picture = models.ImageField(upload_to='media/uploads/stores/', null=True, blank=True)
    thumb = models.ImageField(upload_to='media/uploads/stores/thumbs')
    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)

    def __str__(self):
        return "{}".format(self.name)

class StoreBranch(models.Model):
    store = models.ForeignKey(Store, on_delete=models.CASCADE)
    name = models.CharField(max_length=55)
    address = models.CharField(max_length=127, blank=True)
    city = models.CharField(max_length=55, blank=True)
    zip_code = models.CharField(max_length=6, blank=True)
    state = models.CharField(max_length=31, null=True, blank=True)
    lat = models.FloatField("Latitude")
    lng = models.FloatField("Longitude")
    phone = models.CharField('Phone', max_length=30, null=True, blank=True)
    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)

    def __str__(self):
        return "{} - {}".format(self.name, self.store.name)

class Category(models.Model):
    store = models.ForeignKey(Store, on_delete=models.CASCADE)
    name = models.CharField(max_length=55)
    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)

    def __str__(self):
        return "{} - {}".format(self.name, self.store.name)


class SubCategory(models.Model):
    store = models.ForeignKey(Store, on_delete=models.CASCADE)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    name = models.CharField(max_length=55)
    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)

    def __str__(self):
        return "{} - {} ({})".format(self.name, self.category.name, self.store.name)

class Product(models.Model):
    subcategory = models.ForeignKey(SubCategory, on_delete=models.CASCADE)
    name = models.CharField(max_length=55)
    description = models.TextField()
    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)

    def __str__(self):
        return "{} - {}".format(self.name, subcategory.category.store.name)

class ProductVariation(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    size = models.CharField(max_length=15)
    price = models.DecimalField(decimal_places=2, max_digits=15)
    discount_percentage = models.FloatField("Discount (%)", max_length=10, default=0)
    quantity = models.FloatField("Quantity", max_length=10, default=0)
    color = models.CharField(max_length=15)
    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)

    def __str__(self):
        return "{} - {} - {}".format(self.product.name, size, color)

class ProductPicture(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    picture = models.ImageField(upload_to='media/uploads/products')
    order = models.IntegerField()
    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)


class OrderAddress(models.Model):
    user = models.ForeignKey(User, on_delete=models.PROTECT)
    name = models.CharField("Name", max_length=100, null=True, blank=True)
    lat = models.FloatField("Latitude")
    lng = models.FloatField("Longitude")
    street_number = models.CharField("Street Number", max_length=100, null=True, blank=True)
    street_name = models.CharField("Street Name", max_length=100)
    city = models.CharField("City", max_length=60, null=True, blank=True)
    zip_code = models.CharField(max_length=6, blank=True)
    state = models.CharField(max_length=31, null=True, blank=True)
    phone = models.CharField("Phone", null=True, blank=True, max_length=100)
    unit = models.CharField("Unit", max_length=30, null=True, blank=True)
    note = models.CharField("Note", max_length=250, null=True, blank=True)

    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)

    def __str__(self):
        return "{} {}, {} {} ({},{})".format(
            self.street_number,
            self.street_name,
            self.city,
            self.zip_code,
            self.lat,
            self.lng

        )

class Order(models.Model):
    STATUS_CHOICES = (
        ("pending", "Pending"),
        ("paid", "Paid"),

        ("user_cancelled", "User Cancelled"),
        ("admin_cancelled", "Admin Cancelled"),
        ("admin_rejected", "Admin Rejected"),

        ("store_accepted", "Store Accepted"),
        ("store_rejected", "Store Rejected"),
        ("driver_accepted", "Driver Accepted"),
        ("store_delivered_driver", "Store Delivered To Driver"),
        ("pickedup", "Pickedup"),
        ("onroute", "On Route"),
        ("driver_delivered_sorting", "Delivered to sorting center"),
        ("nearby", "Nearby"),
        ("delivered", "Delivered"),
        ("delivered_courier", "Delivered via courier"),
        ("notdelivered", "Not Delivered")
    )

    user = models.ForeignKey(User, on_delete=models.PROTECT)
    address = models.ForeignKey(OrderAddress, null=True, blank=True, on_delete=models.PROTECT)
    status = models.CharField("Status", max_length=50, choices=STATUS_CHOICES, default="pending")
    payment_status = models.CharField("Payment Status", max_length=50, default="N/A")
    total = models.FloatField("Total", max_length=10, default=0)
    delivery_price = models.FloatField("Delivery Price", max_length=10, default=0)
    grand_total = models.FloatField("Grand Total", max_length=10, default=0)
    notes = models.CharField("Notes", max_length=255, null=True, blank=True)
    currency = models.CharField("Currency", default="AUD", max_length=10)

    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)

    def __str__(self):
        return "{} - {}".format(self.id, self.user.first_name)


class OrderedProduct(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.PROTECT)
    price = models.FloatField("Price", max_length=10, default=0)
    quantity = models.FloatField("Quantity", max_length=10, default=0)
    discount_percentage = models.FloatField("Discount (%)", max_length=10, default=0)
    size = models.CharField("Size", max_length=31, default="N/A")
    product_variation = models.ForeignKey(ProductVariation, null=True, blank=True, on_delete=models.PROTECT)

    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)

    def __str__(self):
        return "{} ({})".format(self.product.name, self.product.id)