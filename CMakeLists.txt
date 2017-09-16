cmake_minimum_required (VERSION 3.0.0)
project(ci-test)

if (MSVC)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /analyze")
  message(STATUS "CMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}")
endif()

add_executable(test1 test1.cpp)
add_subdirectory(src)
