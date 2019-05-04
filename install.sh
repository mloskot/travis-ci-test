#! /bin/bash
#
# AzP requires to run special task in order to export
# SELF and BOOST_ROOT as job-scoped variable from a script.
# Follow invocation of this install.sh in .azure-pipelines.yaml
# with these two lines:
#  echo "##vso[task.setvariable variable=SELF]$SELF"
#  echo "##vso[task.setvariable variable=BOOST_ROOT]$BOOST_ROOT"
#
set -ex

if [ "$AGENT_OS" == "Darwin" ]; then
    unset -f cd
fi

# AzP does not clone into folder named after repository,
# but into one named something like /home/vsts/work/1/s
# SELF needs to be derived from the name of the repository
# that this build is configured for.
export SELF=`basename $BUILD_REPOSITORY_NAME`

# e.g. BUILD_SOURCESDIRECTORY=/home/vsts/work/1/s
# change from /home/vsts/work/1/s to /home/vsts/work/1
cd ..

# e.g. clone into /home/vsts/work/1/boost-root
mkdir boost-root
# TODO: Deploy latest Boost superproject

# e.g. move /home/vsts/work/1/boost-root
# back inside BUILD_SOURCESDIRECTORY=/home/vsts/work/1/s
mv boost-root $BUILD_SOURCESDIRECTORY/
cd $BUILD_SOURCESDIRECTORY/boost-root
# NOTE: AzP images come with predefined BOOST_ROOT that can not be overwritten
# https://gitlab.kitware.com/cmake/cmake/issues/19056
# Set custom variable here, then export as
export BOOST_ROOT="`pwd`"

echo "install.sh: SELF=$SELF"
echo "install.sh: BOOST_ROOT=$BOOST_ROOT"
