#!/bin/make -f

ifeq ("$(wildcard $(debian))","")
WORKDIR = $(shell pwd)
endif

ifeq ("$(wildcard $(debian/patches))","")
PATCH = cd source && git apply $(WORKDIR)/debian/patches/*.patch
endif
