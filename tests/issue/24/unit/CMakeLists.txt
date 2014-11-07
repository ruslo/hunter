cmake_minimum_required(VERSION 3.0)

include("../../../common.cmake")

include(hunter_cmake_args)

hunter_config(Foo VERSION 1.0 CMAKE_ARGS TEST=1)
hunter_cmake_args(Foo CMAKE_ARGS TEST=2)

list(GET HUNTER_Foo_CMAKE_ARGS -1 last_item)

if(NOT last_item STREQUAL "TEST=1")
  message(FATAL_ERROR
    "Expected last CMAKE_ARGS to be the one set by hunter_config."
    "Was '${last_item}'")
endif()