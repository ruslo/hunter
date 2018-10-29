# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.9)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-units)

# DOCUMENTATION_START {
hunter_add_package(units)
find_package(units CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC units::units)
# DOCUMENTATION_END }
