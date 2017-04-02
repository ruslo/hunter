# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-sse2neon)
hunter_add_package(sse2neon)
find_package(sse2neon CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo sse2neon::sse2neon)
