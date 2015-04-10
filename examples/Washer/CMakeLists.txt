# Copyright (c) 2014, Ruslan Baratov
# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-washer)

hunter_add_package(Washer)

find_package(Washer CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo Washer::washer)
