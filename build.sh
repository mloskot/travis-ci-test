#!/bin/bash -e
echo $PWD
cmake \
    -DCMAKE_BUILD_TYPE=Debug \
    ..
