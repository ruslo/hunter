# Copyright (c) 2017, NeroBurner
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-SuiteSparse)

hunter_add_package(SuiteSparse)

string(COMPARE EQUAL "${SuiteSparse_LICENSES}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "Licenses not found")
endif()

message("SuiteSparse licenses:")
foreach(x ${SuiteSparse_LICENSES})
  message("* ${x}")
  if(NOT EXISTS "${SuiteSparse_LICENSES}")
    message(FATAL_ERROR "File not found")
  endif()
endforeach()

find_package(SuiteSparse CONFIG REQUIRED)

# Test double library creation
find_package(SuiteSparse CONFIG REQUIRED)

# Create executable
add_executable(foo foo.cpp)
target_link_libraries(foo PRIVATE SuiteSparse::cholmod)
