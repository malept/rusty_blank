#!/bin/bash -e

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    brew update
    rvm install "$RBLANK_RUBY_VERSION"
    rvm use "$RBLANK_RUBY_VERSION"
fi

if [[ "$TRAVIS_OS_NAME" != "linux" ]]; then
    ruby --version
    if ! which bundle > /dev/null; then
        gem install bundler
    fi
    bundle install --jobs=3 --retry=3 --path=$TRAVIS_BUILD_DIR/vendor/bundle
fi
