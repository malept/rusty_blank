CARGO ?= cargo
TMPDIR := $(shell mktemp -d)
CURDIR := $(shell pwd)
LIBEXT := $(shell ruby -e "require 'rbconfig'; puts RbConfig::CONFIG['DLEXT']")
TARGET ?= release
LIBRARY = target/$(TARGET)/librusty_blank.$(LIBEXT)

test: build
	ruby test.rb $(LIBRARY)

build: $(LIBRARY)

clean:
	rm -rf target

$(LIBRARY):
	$(CARGO) build $(if $(filter release,$(TARGET)),--release)

.PHONY: build clean deb test
