# Copyright (c) 2013-2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-jpeg)

# DOCUMENTATION_START {
hunter_add_package(Jpeg)
find_package(JPEG CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC JPEG::jpeg)
# DOCUMENTATION_END }
