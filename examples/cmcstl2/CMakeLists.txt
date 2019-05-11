# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cmcstl2)

# DOCUMENTATION_START {
hunter_add_package(cmcstl2)
find_package(cmcstl2 CONFIG REQUIRED)

add_executable(simple simple.cpp)
target_link_libraries(simple stl2)
# DOCUMENTATION_END }
