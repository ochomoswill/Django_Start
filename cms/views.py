from django.shortcuts import *
from django.shortcuts import render, redirect
from .models import *
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from .forms import *
from django.contrib import messages
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt


# Create your views here.





# ===========================================================================================================================
# Home Page
# ===========================================================================================================================

def index(request):
    slider_images = SliderImages.objects.all()
    slider_items = Facial_product.objects.all()
    context = {'slider_items': slider_items, 'slider_images': slider_images}
    template = 'views/home.html'
    return render(request, template, context)


# ===========================================================================================================================
# Accessories Page
# ===========================================================================================================================

def accessories(request):
    products = Accessory.objects.all()
    paginator = Paginator(products, 12)
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)
    context = {'products': products, 'page': page}
    template = 'views/accessories.html'
    return render(request, template, context)


def accessories_category_ankle_chains(request):
    products = Accessory.objects.filter(category_id=1)
    category_name = Accessory.objects.filter(category_id=1).first()
    paginator = Paginator(products, 12)
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)
    context = {'products': products, 'page': page, 'category_name': category_name}
    template = 'views/accessory_by_category.html'
    return render(request, template, context)


def accessories_category_body_accessory(request):
    products = Accessory.objects.filter(category_id=2)
    category_name = Accessory.objects.filter(category_id=2).first()
    paginator = Paginator(products, 12)
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)
    context = {'products': products, 'page': page, 'category_name': category_name}
    template = 'views/accessory_by_category.html'
    return render(request, template, context)


def accessories_category_chokers(request):
    products = Accessory.objects.filter(category_id=3)
    category_name = Accessory.objects.filter(category_id=3).first()
    paginator = Paginator(products, 12)
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)
    context = {'products': products, 'page': page, 'category_name': category_name}
    template = 'views/accessory_by_category.html'
    return render(request, template, context)


def accessories_category_hair_accessory(request):
    products = Accessory.objects.filter(category_id=4)
    category_name = Accessory.objects.filter(category_id=4).first()
    paginator = Paginator(products, 12)
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)
    context = {'products': products, 'page': page, 'category_name': category_name}
    template = 'views/accessory_by_category.html'
    return render(request, template, context)


def accessories_category_earings(request):
    products = Accessory.objects.filter(category_id=5)
    category_name = Accessory.objects.filter(category_id=5).first()
    paginator = Paginator(products, 12)
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)
    context = {'products': products, 'page': page, 'category_name': category_name}
    template = 'views/accessory_by_category.html'
    return render(request, template, context)


def accessory_single_product(request, slug):
    products = get_object_or_404(Accessory, slug=slug)
    context = {'products': products}
    template = 'views/accessory_single_product.html'
    return render(request, template, context)


# ===========================================================================================================================
# Facial Products Page
# ===========================================================================================================================

def facial_products(request):
    products = Facial_product.objects.all()
    paginator = Paginator(products, 12)
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)
    context = {'products': products, 'page': page}
    template = 'views/facial_products.html'
    return render(request, template, context)


def single_product(request, slug):
    products = get_object_or_404(Facial_product, slug=slug)
    context = {'products': products}
    template = 'views/facial_products_single_product.html'
    return render(request, template, context)


# ===========================================================================================================================
# Hair Products Page
# ===========================================================================================================================

def hair_products(request):
    products = Hair_product.objects.all()
    paginator = Paginator(products, 12)
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)
    context = {'products': products, 'page': page}
    template = 'views/hair_products.html'
    return render(request, template, context)


def hair_single_product(request, slug):
    products = get_object_or_404(Hair_product, slug=slug)
    context = {'products': products}
    template = 'views/hair_products_single_product.html'
    return render(request, template, context)


# ===========================================================================================================================
# Testimonials Page
# ===========================================================================================================================

def testimonial(request):
    reviews = Testimonials.objects.all()
    paginator = Paginator(reviews, 10)
    page = request.GET.get('page')
    try:
        reviews = paginator.page(page)
    except PageNotAnInteger:
        reviews = paginator.page(1)
    except EmptyPage:
        reviews = paginator.page(paginator.num_pages)
    context = {'reviews': reviews, 'page': page}

    template = 'views/testimonials.html'
    return render(request, template, context)


# ===========================================================================================================================
# Contact Us Page
# ===========================================================================================================================

def contact(request):
    if request.method == "POST":
        form = ReviewForm(request.POST)
        if form.is_valid():
            review = form.save(commit=False)
            review.published = timezone.now()
            review.save()
            redirect('contact')
            messages.success(request, 'Submission Successful.')
    else:
        form = ReviewForm()
    template = 'views/contact_us.html'
    return render(request, template, {'form': form})


# ===========================================================================================================================
# Checkout Page
# ===========================================================================================================================

def checkout(request):
    context = {}
    if "facial_product_list" in request.session:
        print("I am here got the facial_product data")
        # getting updated lists from session
        facial_product_list = request.session["facial_product_list"]
        facial_products = Facial_product.objects.filter(id__in=facial_product_list)
        print(facial_products)
        context['facial_products'] = facial_products


    if "hair_product_list" in request.session:
        # getting updated lists from session
        hair_product_list = request.session["hair_product_list"]
        hair_products = Hair_product.objects.filter(id__in=hair_product_list)
        print("Hair Products: ")
        print(hair_products)
        context['hair_products'] = hair_products

    if "accessory_product_list" in request.session:
        # getting updated lists from session
        accessory_product_list = request.session["accessory_product_list"]
        accessory_products = Accessory.objects.filter(id__in=accessory_product_list)
        print("Accessories: ")
        print(accessory_products)
        context['accessory_products'] = accessory_products

    # if "facial_product_list" in request.session:
    #     context['facial_products'] = facial_products
    #     if "hair_product_list" in request.session:
    #         context['hair_products'] = hair_products
    #         if "hair_product_list" in request.session:
    #             context['accessory_products'] = accessory_products
                # context = {'facial_products': facial_products, 'hair_products': hair_products,
                #            'accessory_products': accessory_products}

    template = 'views/cart.html'

    #PaymentView().get_pesapal_payment_iframe()
    return render(request, template, context)


@csrf_exempt
def checkout_goods(request):
    facial_product_list = []
    hair_product_list = []
    accessory_product_list = []

    # checking if a list exists in the session variable
    if "facial_product_list" in request.session:
        facial_product_list = request.session["facial_product_list"]
    else:
        facial_product_list = []

    if "hair_product_list" in request.session:
        hair_product_list = request.session["hair_product_list"]
    else:
        hair_product_list = []

    if "accessory_product_list" in request.session:
        accessory_product_list = request.session["accessory_product_list"]
    else:
        accessory_product_list = []

    if request.method == "POST":
        product_id = request.POST.get("product_id")
        product_type = request.POST.get("product_type")

        print("I am here got the data")

        if product_type == "facial_products":
            print("I am here got the facial_product data")
            facial_product_list.append(product_id)
            # remove duplicates in the list
            facial_product_list = list(set(facial_product_list))
            # setting updated lists to session
            request.session["facial_product_list"] = facial_product_list
            facial_products = Facial_product.objects.filter(id__in=facial_product_list)

            print("Facial Products: ")
            print(facial_products)

            print(facial_product_list)

        if product_type == "hair_product":
            hair_product_list.append(product_id)
            # remove duplicates in the list
            hair_product_list = list(set(hair_product_list))
            # setting updated lists to session
            request.session["hair_product_list"] = hair_product_list

            hair_products = Hair_product.objects.filter(id__in=hair_product_list)

            print("Hair Products: ")
            print(hair_products)

            print(hair_product_list)

        if product_type == "accessory":
            accessory_product_list.append(product_id)
            # remove duplicates in the list
            accessory_product_list = list(set(accessory_product_list))
            # setting updated lists to session
            request.session["accessory_product_list"] = accessory_product_list

            accessory_products = Accessory.objects.filter(id__in=accessory_product_list)

            print("Accessories: ")
            print(accessory_products)

            print(accessory_product_list)

        print(accessory_product_list)
        print(facial_product_list)
        print(hair_product_list)
        total_count = len(accessory_product_list) + len(hair_product_list) + len(facial_product_list)
        print("Total Cart Count = " + str(total_count))

        return JsonResponse({"data": total_count})
    return JsonResponse({"data": "Something hijacked the goods in transit"})


def buyer_details(request):

    if request.method == "POST":
        email = request.POST.get("email")
        request.session["billing_email"] = email
        global billing_email
        billing_email= email
        firstname = request.POST.get("firstname")
        global billing_firstname
        billing_firstname = firstname
        lastname = request.POST.get("lastname")
        global billing_lastname
        billing_lastname = lastname
        address = request.POST.get("address")
        global billing_address
        billing_address = address
        amount = request.POST.get("amount")
        global billing_amount
        billing_amount = amount

        print(email + " " + firstname +" "+ lastname +" "+ address + " " + amount)




        return JsonResponse({"data": "Buyer Details received"})
        #return JsonResponse({"data": url})


@csrf_exempt
def decart(request):
    facial_product_list = []
    hair_product_list = []
    accessory_product_list = []

    # checking if a list exists in the session variable
    if "facial_product_list" in request.session:
        facial_product_list = request.session["facial_product_list"]
    else:
        facial_product_list = []

    if "hair_product_list" in request.session:
        hair_product_list = request.session["hair_product_list"]
    else:
        hair_product_list = []

    if "accessory_product_list" in request.session:
        accessory_product_list = request.session["accessory_product_list"]
    else:
        accessory_product_list = []

    if request.method == "POST":
        product_id = request.POST.get("product_id")
        product_type = request.POST.get("product_type")

        print("I am here got the data")

        if product_type == "facial_products":
            print("I am here got the facial_product data")
            facial_product_list.remove(product_id)
            # remove duplicates in the list
            facial_product_list = list(set(facial_product_list))
            # setting updated lists to session
            request.session["facial_product_list"] = facial_product_list
            facial_products = Facial_product.objects.filter(id__in=facial_product_list)

            print("Facial Products: ")
            print(facial_products)

            print(facial_product_list)

        if product_type == "hair_product":
            hair_product_list.remove(product_id)
            # remove duplicates in the list
            hair_product_list = list(set(hair_product_list))
            # setting updated lists to session
            request.session["hair_product_list"] = hair_product_list

            hair_products = Hair_product.objects.filter(id__in=hair_product_list)

            print("Hair Products: ")
            print(hair_products)

            print(hair_product_list)

        if product_type == "accessory":
            accessory_product_list.remove(product_id)
            # remove duplicates in the list
            accessory_product_list = list(set(accessory_product_list))
            # setting updated lists to session
            request.session["accessory_product_list"] = accessory_product_list

            accessory_products = Accessory.objects.filter(id__in=accessory_product_list)

            print("Accessories: ")
            print(accessory_products)

            print(accessory_product_list)

        print(accessory_product_list)
        print(facial_product_list)
        print(hair_product_list)
        total_count = len(accessory_product_list) + len(hair_product_list) + len(facial_product_list)
        print("Total Cart Count = " + str(total_count))

        return JsonResponse({"data": total_count})
    return JsonResponse({"data": "Something hijacked the goods in transit"})

from django_pesapal.views import PaymentRequestMixin
from django.views.generic import TemplateView


class PaymentView(TemplateView, PaymentRequestMixin):
    """
    Make payment view
    """
    template_name = 'views/payment.html'

    def get_context_data(self, **kwargs):
        ctx = super(PaymentView, self).get_context_data(**kwargs)

        # order_info = {
        #     'first_name': 'Ochomo',
        #     'last_name': 'William',
        #     'amount': 5000,
        #     'description': 'Payment for X',
        #     'reference': 2,
        #     'email': 'ochomoswill@gmail.com'
        # }

        order_info = {
            'first_name': billing_firstname,
            'last_name': billing_lastname,
            'amount': billing_amount,
            'description': 'Payment for X',
            'reference': 2,
            'email': billing_email
        }

        ctx['pesapal_url'] = self.get_payment_url(**order_info)

        return ctx

def get_order_info(request):

    order_info = {
        'first_name': billing_firstname,
        'last_name': billing_lastname,
        'amount': 5000,
        'description': 'Payment for X',
        'reference': 2,
        'email': billing_email
    }


    return order_info


class PaymentViewData(TemplateView, PaymentRequestMixin):
    """
    Make payment view
    """
    template_name = 'views/payment.html'


    def get_context_data(self, **kwargs):
        ctx = super(PaymentViewData, self).get_context_data(**kwargs)

        # order_info = {
        #     'first_name': 'Ochomo',
        #     'last_name': 'William',
        #     'amount': 5000,
        #     'description': 'Payment for X',
        #     'reference': 2,
        #     'email': 'ochomoswill@gmail.com'
        # }
        order_info = get_order_info()

        ctx['pesapal_url'] = self.get_payment_url(**order_info)
        url = self.get_payment_url(**order_info)

        return JsonResponse({"data":url})

class PaymentResponse(TemplateView):

    template_name = 'views/response.html'


