cmake_minimum_required (VERSION 3.13.0)
project(ci-test LANGUAGES CXX)
enable_testing()
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_BINARY_DIR}/cmake)

set(CMAKE_CXX_STANDARD 11 CACHE STRING "C++ standard version to use (default is 11)")
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
message(STATUS "ci-test: Configuring C++${CMAKE_CXX_STANDARD}")

if(NOT EXISTS "${CMAKE_BINARY_DIR}/cmake/FindBoost.cmake")
  message(STATUS "ci-test: Downloading latest FindBoost.cmake from https://gitlab.kitware.com/cmake/")
  file(DOWNLOAD
    "https://gitlab.kitware.com/cmake/cmake/raw/release/Modules/FindBoost.cmake"
    "${CMAKE_BINARY_DIR}/cmake/FindBoost.cmake")
endif()
set(Boost_DEBUG ON)
find_package(Boost 1.65.0 COMPONENTS filesystem)

add_executable(test1 test1.cpp)
add_test(NAME test1 COMMAND test1)

add_executable(filesystem filesystem.cpp)
if(Boost_FOUND)
  target_link_libraries(filesystem PRIVATE Boost::filesystem)
  target_compile_definitions(filesystem PRIVATE CI_TEST_HAS_BOOST_FILESYSTEM)
endif()
add_test(NAME test_filesystem COMMAND filesystem)
