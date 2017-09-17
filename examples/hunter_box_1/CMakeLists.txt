# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-hunter_box_1)

hunter_add_package(hunter_box_1)
find_package(hunter_box_1 CONFIG REQUIRED)

add_executable(hunter_box_1 foo.cpp)
target_link_libraries(hunter_box_1 hunter_box_1::hunter_box_1)
