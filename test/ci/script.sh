#!/bin/bash -e

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
    sudo docker run --interactive --tty --volume $(pwd):/code malept/rust-ruby-container:$DOCKER_TAG bash /code/test/ci/docker.sh
else
    bundle exec rake test
    bundle exec rake thermite:tarball
    bundle exec rake install

    if [[ -z "$TRAVIS_TAG" ]]; then
      gem uninstall rusty_blank
      CARGO=fake bundle exec rake install
    fi

    if [[ -z "$TRAVIS_TAG" ]]; then
      gem uninstall rusty_blank
      gem install minitest
      CARGO=fake gem install pkg/*.gem
      ruby test/test_rusty_blank.rb
    fi

    if [[ -f "$THERMITE_DEBUG_FILENAME" ]]; then cat $THERMITE_DEBUG_FILENAME; fi
fi
