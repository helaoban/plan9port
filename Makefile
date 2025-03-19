this-makefile	:= $(lastword $(MAKEFILE_LIST))
srctree		:= $(realpath $(dir $(this-makefile)))

# needed to compile with X-specific modules
X11=$(GUIX_ENVIRONMENT)

export srctree X11

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
	cd dev && ./acme -f "/mnt/font/DejaVuSansMono/15a/font"

build-acme:
	cd src/cmd/acme && 9 mk install

build-devdraw:
	cd src/cmd/devdraw &&  9 mk install

.PHONY: env build install full acme build-acme
