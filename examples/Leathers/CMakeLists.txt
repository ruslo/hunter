# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-leathers)

# DOCUMENTATION_START {
hunter_add_package(Leathers)
find_package(Leathers CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC Leathers::leathers)
# DOCUMENTATION_END }
