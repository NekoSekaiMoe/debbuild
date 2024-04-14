#!/bin/make -f

ifneq ("$(wildcard $(LICENSE))","")
WORKDIR = $(shell pwd)/packages/preppipe-gui
else
WORKDIR = $(shell pwd)
endif

ifeq ("$(wildcard $(debian/patches))","")
PATCH = cd source && git apply $(WORKDIR)/debian/patches/*.patch
endif

build:
	git clone https://github.com/PrepPipe/preppipe-gui --depth=1 $(WORKDIR)/source
	$(PATCH)
	cd source && cp ../debian -rv source && dpkg-buildpackage -b -us -uc -d

.PHONY: clean
clean:
	git clean -dxf
