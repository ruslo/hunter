# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-caffe)

# download caffe
hunter_add_package(caffe)

# now caffe can be used
find_package(Caffe CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo caffe)
