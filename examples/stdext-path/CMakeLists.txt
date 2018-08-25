# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-stdext-path)

# DOCUMENTATION_START {
hunter_add_package(stdext-path)
find_package(stdext-path CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC stdext-path::stdext-path)
# DOCUMENTATION_END }
