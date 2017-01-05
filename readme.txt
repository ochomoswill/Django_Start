Start Project
===================================================
$ django-admin startproject aura_cms


Runserver
===================================================
$ python manage.py runserver


Creating App
===================================================
$ python manage.py startapp cms


Connecting to MySQL_Db
===================================================
In CMD

pip install wheel
pip install pymysql


In settings.py

import pymysql
pymysql.install_as_MySQLdb()


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'cms',
        'HOST': 'localhost',
        'PORT': '3306',
        'USER': 'root',
        'PASSWORD': '',
    }
}

Creating Models
===================================================

Change your models (in models.py).

Include App('blog') in the settings.py

Run python manage.py makemigrations blog - to create migrations for those changes
Run python manage.py migrate - to apply those changes to the database.


Creating an Admin User
===================================================

$ python manage.py createsuperuser

from .models import Post - add on admin.py
