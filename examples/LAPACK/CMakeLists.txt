# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-LAPACK)

hunter_add_package(LAPACK)

string(COMPARE EQUAL "${LAPACK_LICENSES}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "Licenses not found")
endif()

message("LAPACK licenses:")
foreach(x ${LAPACK_LICENSES})
  message("* ${x}")
  if(NOT EXISTS "${LAPACK_LICENSES}")
    message(FATAL_ERROR "File not found")
  endif()
endforeach()

find_package(LAPACK CONFIG REQUIRED)
# Test double library creation
find_package(LAPACK CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo blas lapack)

