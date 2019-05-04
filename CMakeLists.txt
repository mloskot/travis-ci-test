cmake_minimum_required (VERSION 3.13.0 FATAL_ERROR)
project(ci-test
  VERSION 1.0.0
  DESCRIPTION "Project to learn features and configurations of various public CI service"
  HOMEPAGE_URL "https://github.com/mloskot/ci-test"
  LANGUAGES CXX)
enable_testing()
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_BINARY_DIR}/cmake)

set(CMAKE_CXX_STANDARD 11 CACHE STRING "C++ standard version to use (default is 11)")
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
message(STATUS "ci-test: Configuring C++${CMAKE_CXX_STANDARD}")

add_executable(test1 test1.cpp)
add_test(NAME test1 COMMAND test1)
