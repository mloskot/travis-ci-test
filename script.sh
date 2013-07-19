#!/bin/bash -e
echo $PWD
builddir="${TRAVIS_BUILD_DIR}/src/_build"
mkdir -p ${builddir}
cd ${builddir}
echo $PWD
$TRAVIS_BUILD_DIR/build.sh
