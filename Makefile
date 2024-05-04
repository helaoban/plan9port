this-makefile	:= $(lastword $(MAKEFILE_LIST))
srctree		:= $(realpath $(dir $(this-makefile)))

export srctree

%:
	@echo read the README file

env:
	@ ./env

build:
	X11=$(GUIX_ENVIRONMENT) ./INSTALL -b

install:
	X11=$(GUIX_ENVIRONMENT) ./INSTALL -c

full: build install

acme:
	9 acme -f "/mnt/font/DejaVuSansMono/11a/font"

.PHONY: env build install full acme
