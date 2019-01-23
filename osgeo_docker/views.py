#-*- coding: utf-8 -*-
from django.http import HttpResponse
from osgeo import ogr # sudo pip install gdal

def hello(request):
    return HttpResponse('Hello, World!')
