CARGO ?= cargo
TMPDIR := $(shell mktemp -d)
CURDIR := $(shell pwd)
LIBEXT := $(shell ruby -e "require 'rbconfig'; puts RbConfig::CONFIG['DLEXT']")
LIBRARY = target/release/librusty_blank.$(LIBEXT)

test: build
	ruby test.rb $(LIBRARY)

build: $(LIBRARY)

clean:
	rm -rf target

$(LIBRARY):
	$(CARGO) build --release

.PHONY: build clean deb test
