# Copyright (c) 2016-2018, Ruslan Baratov
# Copyright (c) 2018, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-frugally-deep)

# DOCUMENTATION_START {
hunter_add_package(frugally-deep)
find_package(frugally-deep CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo frugally-deep::fdeep)
# DOCUMENTATION_END }
