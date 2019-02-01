# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-blake2s-opt)

# DOCUMENTATION_START {
hunter_add_package(blake2s-opt)
find_package(blake2s-opt REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC libblake2s::libblake2s)
# DOCUMENTATION_END }
