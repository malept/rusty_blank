#/bin/bash -e

export PATH=$HOME/.cargo/bin:$PATH
cd /code

TRAVIS_BUILD_DIR=/code test/ci/before_install.sh
THERMITE_DEBUG_FILENAME=/tmp/thermite.log LD_LIBRARY_PATH=/usr/local/lib test/ci/script.sh
