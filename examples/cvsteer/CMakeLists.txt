# Copyright (c) 2016-2018, Ruslan Baratov
# Copyright (c) 2018, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cvsteer)

# DOCUMENTATION_START {
hunter_add_package(cvsteer)
find_package(cvsteer CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC cvsteer::cvsteer)
# DOCUMENTATION_END }
