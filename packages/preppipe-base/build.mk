#!/bin/make -f

ifneq ("$(wildcard $(LICENSE))","")
WORKDIR = $(shell pwd)/packages/preppipe-base
else
WORKDIR = $(shell pwd)
endif


build:
	git clone https://github.com/PrepPipe/preppipe-python --depth=1 $(WORKDIR)/source
	cd source && cp ../debian -rv source && dpkg-buildpackage -b -us -uc -d

.PHONY: clean
clean:
	git clean -dxf
