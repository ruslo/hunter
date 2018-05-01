# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-folly)

# DOCUMENTATION_START {
hunter_add_package(folly)
find_package(folly CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC Folly::folly)
# DOCUMENTATION_END }
