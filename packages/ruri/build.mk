#!/bin/make -f

ifneq ("$(wildcard $(LICENSE))","")
WORKDIR = $(shell pwd)/packages/chdman
else
WORKDIR = $(shell pwd)
endif

ifeq ("$(wildcard $(debian/patches))","")
PATCH = cd source && git apply $(WORKDIR)/debian/patches/*.patch
endif


build:
	git clone https://github.com/charlesthobe/chdman --depth=1 $(WORKDIR)/source
	$(PATCH)
	cd source && ln -s ../debian debian && dpkg-buildpackage -b -us -uc -d

.PHONY: clean
clean:
	rm -rf source/ debian/chdman.debhelper.log debian/chdman/ debian/debhelper-build-stamp
distclean:
	git clean -dxf
