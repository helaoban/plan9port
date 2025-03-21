this-makefile	:= $(lastword $(MAKEFILE_LIST))
srctree		:= $(realpath $(dir $(this-makefile)))

X11 := $(GUIX_ENVIRONMENT)

export srctree X11

%:
	@echo read the README file

all: build

env:
	@ ./env

build:
	./INSTALL -b

install:
	./INSTALL -c

full: build install

acme:
	cd src/cmd/acme && 9 mk install

devdraw:
	cd src/cmd/devdraw && 9 mk install

run-acme:
	cd dev && ./acme -f "/mnt/font/DejaVuSans/15a/font" -F "/mnt/font/DejaVuSansMono/15a/font"

.PHONY: env build install full acme
