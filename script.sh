#!/bin/bash -e
builddir="${TRAVIS_BUILD_DIR}/src/_build"
mkdir -p ${builddir}
cd ${builddir}
$TRAVIS_BUILD_DIR/build.sh
