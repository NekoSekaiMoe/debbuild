#!/bin/make -f

ifneq ("$(wildcard $(LICENSE))","")
WORKDIR = $(shell pwd)/packages/history-commit
else
WORKDIR = $(shell pwd)
endif

ifeq ("$(wildcard $(debian/patches))","")
PATCH = cd source && git apply $(WORKDIR)/debian/patches/*.patch
endif


build:
	$(PATCH)
	cd source && ln -s ../debian debian && dpkg-buildpackage -b -us -uc -d

.PHONY: clean
clean:
	git clean -dxf
