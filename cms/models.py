from django.utils import timezone
from django.db import models
from django.core.urlresolvers import reverse
from django.template.defaultfilters import slugify

# Create your models here.



class Accessory_Category(models.Model):
    name= models.CharField(max_length=250)
    slug = models.SlugField(max_length=250, unique=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'accessory_category'
        verbose_name_plural = 'accessory_categories'

    def get_absolute_url(self):
        return reverse('accessory_by_category', args = [self.slug])

    def __str__(self):
        return self.name

class Accessory(models.Model):
    category = models.ForeignKey(Accessory_Category)
    name = models.CharField(max_length=250)
    description = models.TextField()
    image = models.ImageField(upload_to='accessories_upload/%Y/%m/%d/')
    price = models.DecimalField(decimal_places=2, max_digits=10)
    slug = models.SlugField(max_length=250)

    # creates the slug
    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Accessory, self).save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('accessory_single_product', args=[self.slug])

    def __str__(self):
        return self.name


class Hair_product(models.Model):
    name = models.CharField(max_length=250)
    description = models.TextField()
    image = models.ImageField(upload_to='hairproducts_upload/%Y/%m/%d/')
    price = models.DecimalField(decimal_places=2, max_digits=10)
    slug = models.SlugField(max_length=250, unique=True)

    # creates the slug
    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Hair_product, self).save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('hair_single_product', args=[self.slug])

    def __str__(self):
        return self.name



class Facial_product(models.Model):
    name = models.CharField(max_length=250)
    slug = models.SlugField(max_length=250, unique=True)
    description = models.TextField()
    image = models.ImageField(upload_to='facialproducts_upload/%Y/%m/%d/')
    price = models.DecimalField(max_digits=10 , decimal_places=2)


    # creates the slug
    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Facial_product, self).save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('single_product', args=[self.slug])

    def __str__(self):
        return self.name


class Testimonials(models.Model):
    STATUS_CHOICES = (('draft','Draft'),('publish','Publish'),)
    name = models.CharField(max_length=250)
    message = models.TextField()
    email = models.EmailField()
    published = models.DateTimeField(default=timezone.now)
    status = models.CharField(max_length=9, choices=STATUS_CHOICES, default='draft')

    def __str__(self):
        return self.name

class SliderImages(models.Model):
    name = models.CharField(max_length=250)
    image = models.ImageField(upload_to='sliderimage_upload/')
    uploaded_date = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.name


