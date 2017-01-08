from django.shortcuts import *
from .models import *
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from .forms import *
from django.contrib import messages

# Create your views here.

# ===========================================================================================================================
# Home Page
# ===========================================================================================================================

def index(request):
    slider_images = SliderImages.objects.all()
    slider_items = Facial_product.objects.all()
    context = {'slider_items': slider_items, 'slider_images': slider_images }
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
    context = {'products': products, 'page': page, 'category_name':category_name}
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
    context = {'products': products, 'page': page, 'category_name':category_name}
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
    context = {'products': products, 'page': page, 'category_name':category_name}
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
    context = {'products': products, 'page': page, 'category_name':category_name}
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
    context = {'products': products, 'page': page, 'category_name':category_name}
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
     context = {'products': products , 'page':page}
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










