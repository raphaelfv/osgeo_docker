# GDAL dockerfile makefile

SHELL = /bin/bash
nametag = mapbox/gdal:0.1

.PHONY: all build test

all: build

build:
	docker build -t $(nametag) .
