FROM ubuntu:14.04

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

MAINTAINER Matthew Perry <perry@mapbox.com>

RUN apt-get update -qq && apt-get upgrade -y
RUN apt-get install -y libhdf5-dev build-essential libssl-dev openssl software-properties-common util-linux python-dev python-pip unzip libfreetype6-dev libatlas-dev libatlas-base-dev liblapack-dev gfortran libgmp-dev libmpfr-dev ccache libpng-dev zlib1g-dev wget git-core checkinstall libproj-dev libgeos-3.4.2 libgeos-c1 libgeos-dev libproj0 proj-data libspatialite-dev libspatialite5 libsqlite3-dev libssl-dev libtiff5 libwebp-dev libwebp5 libjpeg-dev python2.7 libcurl4-gnutls-dev libtiff-dev

RUN mkdir -p /build

COPY gdal-download.sh /tmp/gdal-download.sh
RUN sh /tmp/gdal-download.sh

COPY gdal-build.sh /tmp/gdal-build.sh
RUN sh /tmp/gdal-build.sh
