# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-nanoflann)

hunter_add_package(nanoflann)
find_package(nanoflann CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo nanoflann::nanoflann)
