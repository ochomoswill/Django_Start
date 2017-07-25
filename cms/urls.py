"""aura_cms URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.conf import settings
from . import views
#setting up the media
from django.conf.urls.static import static
from views import PaymentView,PaymentResponse,PaymentViewData

urlpatterns = [
    # Home page
    url(r'^$', views.index, name='index'),

    # Accessories
    url(r'^accessories/$', views.accessories, name='accessories'),
    url(r'^accessories/ankle_chains$', views.accessories_category_ankle_chains, name='accessory_ankle_chains'),
    url(r'^accessories/body_accessories', views.accessories_category_body_accessory, name='accessory_body_accessory'),
    url(r'^accessories/chokers', views.accessories_category_chokers, name='accessory_chokers'),
    url(r'^accessories/hair_accessories', views.accessories_category_hair_accessory, name='accessory_hair_accessory'),
    url(r'^accessories/earings', views.accessories_category_earings, name='accessory_earings'),
    url(r'^accessories/(?P<slug>[-\w]+)/$', views.accessory_single_product, name='accessory_single_product'),

    # Hair Products
    url(r'^hair_products/$', views.hair_products, name='hair_products'),
    url(r'^hair_products/(?P<slug>[-\w]+)/$', views.hair_single_product, name='hair_single_product'),

    # Facial Products
    url(r'^facial_products/$', views.facial_products, name='facial_products'),
    url(r'^facial_products/(?P<slug>[-\w]+)/$', views.single_product, name='single_product'),

    # Testimonials
    url(r'^testimonials/$', views.testimonial, name='testimonials'),

    # Contact Us
    url(r'^contact/$', views.contact, name='contact'),

    # Checkout
    url(r'^cart/$', views.checkout, name='checkout'),
    url(r'^decart/$', views.decart, name='decart'),
    url(r'^checkout_goods/$', views.checkout_goods, name='checkout_goods'),
    url(r'^buyer_details/$', views.buyer_details, name='buyer_details'),

    #url(r'^PaymentView/$', views.PaymentView.get_pesapal_payment_iframe(), name='PaymentView'),
    url(r'^payment/$', PaymentView.as_view(), name='payment'),
    url(r'^payment_data/$', PaymentViewData.as_view(), name='payment_data'),

    url(r'^completed_transaction/$', PaymentResponse.as_view(), name='completed_transaction'),




]




#setting up the media file
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)