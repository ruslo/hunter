# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-libigl)

# DOCUMENTATION_START {
hunter_add_package(libigl)
find_package(libigl CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC igl::core)
# DOCUMENTATION_END }
