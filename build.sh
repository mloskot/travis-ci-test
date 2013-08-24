#!/bin/bash -e
echo $PWD
cmake \
    -DCMAKE_BUILD_TYPE=Debug \
    ..
make
file src/test2
ldd src/test2
