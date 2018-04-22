# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-duktape)

# DOCUMENTATION_START {
hunter_add_package(duktape)
find_package(duktape CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC duktape::duktape)
# DOCUMENTATION_END }
