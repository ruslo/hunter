# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-range-v3)

# DOCUMENTATION_START {
hunter_add_package(range-v3)
find_package(range-v3 CONFIG REQUIRED)

add_executable(comprehensions comprehensions.cpp)
target_link_libraries(comprehensions PUBLIC range-v3)
# DOCUMENTATION_END }
