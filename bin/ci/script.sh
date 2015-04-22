#!/bin/bash
echo $PWD
builddir="${TRAVIS_BUILD_DIR}/src/_build"
mkdir -p ${builddir}
cd ${builddir}
echo $PWD
$TRAVIS_BUILD_DIR/bin/ci/build.sh

if [ -x ${script} ]; then
	${script}
fi
