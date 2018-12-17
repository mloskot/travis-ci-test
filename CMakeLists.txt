cmake_minimum_required (VERSION 3.0.0)
project(ci-test)
add_executable(test1 test1.cpp)
add_test(NAME test1 COMMAND test1)
