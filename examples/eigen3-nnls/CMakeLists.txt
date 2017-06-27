# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-eigen3-nnls)

hunter_add_package(eigen3-nnls)
find_package(eigen3-nnls CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo eigen3-nnls::eigen3-nnls)
