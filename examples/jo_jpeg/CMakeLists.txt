# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-jo_jpeg)

hunter_add_package(jo_jpeg)
find_package(jo_jpeg CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo jo_jpeg::jo_jpeg)
