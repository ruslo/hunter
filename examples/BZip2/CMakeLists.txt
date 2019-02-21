# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-bzip2)

hunter_add_package(BZip2)

find_package(BZip2 CONFIG REQUIRED)
add_executable(foo foo.cpp)
target_link_libraries(foo BZip2::bz2)

if(MSVC)
  target_compile_definitions(
      foo
      PRIVATE
      _CRT_SECURE_NO_WARNINGS
  )
endif()
