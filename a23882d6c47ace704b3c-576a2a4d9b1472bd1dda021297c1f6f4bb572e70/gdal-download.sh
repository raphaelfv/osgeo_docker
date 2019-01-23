#!/bin/bash

set -e

PROJECT_HOME=/build
cd $PROJECT_HOME

# Collect all the source tarballs
wget http://download.osgeo.org/gdal/gdal-1.9.2.tar.gz
wget http://download.osgeo.org/gdal/1.10.1/gdal-1.10.1.tar.gz
wget http://download.osgeo.org/gdal/1.11.4/gdal-1.11.4.tar.gz
wget http://download.osgeo.org/gdal/2.0.2/gdal-2.0.2.tar.gz
wget -r --no-parent -nd -A 'gdal-svn-trunk-*.tar.gz' http://www.gdal.org/daily/
