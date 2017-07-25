# Copyright (c) 2013-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-glapi)

find_package(glapi REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC glapi::glapi)
