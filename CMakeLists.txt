cmake_minimum_required (VERSION 3.0.0)
project(ci-test LANGUAGES CXX)
enable_testing()
set(CMAKE_CXX_STANDARD 11 CACHE STRING "C++ standard version to use (default is 11)")
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
message(STATUS "ci-test: Configuring C++${CMAKE_CXX_STANDARD}")

find_package(Boost 1.65.0 COMPONENTS filesystem)

add_executable(test1 test1.cpp)
add_test(NAME test1 COMMAND test1)

add_executable(filesystem filesystem.cpp)
add_test(NAME test_filesystem COMMAND filesystem)
