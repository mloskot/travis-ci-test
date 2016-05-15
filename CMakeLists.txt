cmake_minimum_required (VERSION 2.8)
project(ci-test)

if (MSVC)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /analyze")
  message(STATUS "CMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}")
endif()

add_subdirectory(src)

