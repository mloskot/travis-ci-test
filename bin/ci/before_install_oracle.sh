#!/bin/bash -e
# Install Oracle client libraries for SOCI at travis-ci.org
#
# Copyright (c) 2013 Mateusz Loskot <mateusz@loskot.net>
#
source ${TRAVIS_BUILD_DIR}/bin/ci/common.sh
source ${TRAVIS_BUILD_DIR}/bin/ci/oracle.sh

sudo apt-get install -qq tar bzip2 libaio1
