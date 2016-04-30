CARGO ?= cargo
LIBEXT := $(shell ruby -e "require 'rbconfig'; dlext = RbConfig::CONFIG['DLEXT']; puts dlext == 'bundle' ? 'dylib' : dlext")
TARGET ?= release
LIBRARY = target/$(TARGET)/librusty_blank.$(LIBEXT)

test: build
	ruby test.rb $(LIBRARY)

build: $(LIBRARY)

clean:
	rm -rf target

$(LIBRARY):
	$(CARGO) build $(if $(filter release,$(TARGET)),--release)

.PHONY: build clean test
