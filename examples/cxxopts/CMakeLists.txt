# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cxxopts)

# DOCUMENTATION_START {
hunter_add_package(cxxopts)
find_package(cxxopts CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC cxxopts::cxxopts)
# DOCUMENTATION_END }
