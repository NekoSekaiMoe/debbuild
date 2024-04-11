#!/bin/make -f

ifneq ("$(wildcard $(LICENSE))","")
$(shell exit 1)
endif
ifneq ("$(wildcard $(.git))","")
$(shell exit 1)
endif

SUBDIRS = chdman preppipe-gui

all: build

build: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: clean
clean: .git
	git clean -dxf
