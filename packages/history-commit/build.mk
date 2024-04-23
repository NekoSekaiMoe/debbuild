#!/bin/make -f
include ../../tools/include.mk
build:
	$(PATCH)
	cd source && ln -s ../debian debian && dpkg-buildpackage -b -us -uc -d

.PHONY: clean
clean:
	git clean -dxf
