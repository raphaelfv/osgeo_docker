Docker containers with GDAL version built from source. Based on Ubuntu 14.04

```
$ docker run mapbox/gdal:0.1 ls /usr/local/gdal/
gdal-1.10.1
gdal-1.11.4
gdal-1.9.2
gdal-2.0.2
gdal-svn-trunk-2016.03.28

$ docker run -e PATH=/usr/local/gdal/gdal-1.11.4/bin mapbox/gdal:0.1 gdalinfo --version
GDAL 1.11.4, released 2016/01/25
```