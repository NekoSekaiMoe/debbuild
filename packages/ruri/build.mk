#!/bin/make -f
include ../../tools/include.mk

build:
	git clone https://github.com/charlesthobe/chdman --depth=1 $(WORKDIR)/source
	$(PATCH)
	cd source && ln -s ../debian debian && dpkg-buildpackage -b -us -uc -d

.PHONY: clean
clean:
	rm -rf source/ debian/chdman.debhelper.log debian/chdman/ debian/debhelper-build-stamp
distclean:
	git clean -dxf
