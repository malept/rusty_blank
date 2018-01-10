#/bin/bash

cd /code

TRAVIS_BUILD_DIR=/code test/ci/before_install.sh
THERMITE_DEBUG_FILENAME=/tmp/thermite.log test/ci/script.sh
