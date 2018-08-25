# Copyright (c) 2016-2018, Ruslan Baratov
# Copyright (c) 2018, Yassine Maddouri
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-dynalo)

# DOCUMENTATION_START {
hunter_add_package(dynalo)
find_package(dynalo CONFIG REQUIRED)

add_executable(dynalo-example-loader dynalo-example-loader.cpp)
target_link_libraries(dynalo-example-loader dynalo)
# DOCUMENTATION_END }