#!/bin/make -f

ifneq ("$(wildcard $(LICENSE))","")
WORKDIR = $(shell pwd)/packages/chdman
else
WORKDIR = $(shell pwd)
endif


build:
	git clone https://github.com/charlesthobe/chdman --depth=1 $(WORKDIR)/source
	cd souece && cp ../debian -rv source && dpkg-buildpackage -b -us -uc -d

.PHONY: clean
clean:
	git clean -dxf
