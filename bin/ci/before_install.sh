#!/bin/bash
source ${TRAVIS_BUILD_DIR}/bin/ci/common.sh

sudo add-apt-repository -y ppa:apt-fast/stable
sudo apt-get update -qq -y
sudo apt-get install -qq -y apt-fast
sudo apt-fast install -qq -y g++-multilib mingw32
sudo apt-fast update -qq -y

before_install="${TRAVIS_BUILD_DIR}/bin/ci/before_install_${SOCI_TRAVIS_BACKEND}.sh"
if [ -x ${before_install} ]; then
	${before_install}
fi