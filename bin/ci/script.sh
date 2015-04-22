#!/bin/bash -e
echo $PWD
builddir="${TRAVIS_BUILD_DIR}/src/_build"
mkdir -p ${builddir}
cd ${builddir}
echo $PWD
$TRAVIS_BUILD_DIR/bin/ci/build.sh

[ -z ${SOCI_TRAVIS_BACKEND+x} ] || exit 0

script="${TRAVIS_BUILD_DIR}/bin/ci/script_${SOCI_TRAVIS_BACKEND}.sh"
[ -x ${script} ] && ${script} || echo "nothing to run"
