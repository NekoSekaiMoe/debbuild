#!/bin/make -f
include ../../tools/include.mk

build:
	git clone https://github.com/PrepPipe/preppipe-gui --depth=1 $(WORKDIR)/source
	$(PATCH)
	cd source && cp ../debian -rv source && dpkg-buildpackage -b -us -uc -d

.PHONY: clean
clean:
	git clean -dxf
