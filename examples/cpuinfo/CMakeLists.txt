# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cpuinfo)

# DOCUMENTATION_START {
hunter_add_package(cpuinfo)
find_package(cpuinfo CONFIG REQUIRED)

add_executable(test example.cpp)
target_link_libraries(test cpuinfo::cpuinfo)
# DOCUMENTATION_END }

