#!/bin/bash -e
echo $PWD
cmake \
    -DCMAKE_BUILD_TYPE=Debug \
    ..
make
pwd
find
file test1
ldd test1
./test1
file test2
ldd test2
#./test2