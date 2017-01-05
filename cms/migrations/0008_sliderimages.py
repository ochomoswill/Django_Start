# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-01-02 07:00
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0007_auto_20161231_0007'),
    ]

    operations = [
        migrations.CreateModel(
            name='SliderImages',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250)),
                ('image', models.ImageField(upload_to='sliderimage_upload/%Y/%m/%d/')),
                ('uploaded_date', models.DateTimeField(default=django.utils.timezone.now)),
            ],
        ),
    ]