#!/bin/bash -e
echo $PWD
cmake \
    -DCMAKE_BUILD_TYPE=Debug \
    ..
make
pwd
ls
file test
ldd test
./test
file test2
ldd test2
