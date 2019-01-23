#!/bin/bash

set -e

MAINTAINER=perry@mapbox.com
NUMCPU=$(grep --count ^processor /proc/cpuinfo)

PROJECT_HOME=/build

mkdir -p /usr/local/gdal
CFLAGS=""
CXXFLAGS=""

cd $PROJECT_HOME
# Process each tarball
TARBALLS=/build/*.tar.gz
for tarball in $TARBALLS
do
    cd $PROJECT_HOME
    GDALDIR=${tarball%.*.*}

    echo $tarball
    tar -xzf $tarball
    cd $GDALDIR
    VERSION=$(cat VERSION)
     
    # Use the ubuntu-gis as guidance for configuration here
    # But limit it to formats we actually use
    ./configure \
        --prefix=/usr/local/gdal/gdal-${VERSION} \
        --with-threads \
        --with-grass=no \
        --with-hide-internal-symbols=yes \
        --with-rename-internal-libtiff-symbols=yes \
        --with-rename-internal-libgeotiff-symbols=yes \
        --with-libtiff=internal \
        --with-geotiff=internal \
        --with-perl=no \
        --with-ruby=no \
        --with-java=no \
        --with-python=no \
        --with-hdf5 \
        --with-webp \
        --with-xerces \
        --with-geos \
        --with-sqlite3 \
        --with-curl \
        --with-pg \
        --with-static-proj4=yes \
        --with-spatialite=/usr \
        --with-cfitsio=no \
        --with-ecw=no \
        --with-mrsid=no

        # TODO Optimizations or extra include dirs?
        # CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)"; \

    make -j${NUMCPU}
    make install
done
