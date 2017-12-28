# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-IF97)

hunter_add_package(IF97)
find_package(IF97 CONFIG REQUIRED)

add_executable(IF97 IF97.cpp)
target_link_libraries(IF97 IF97::IF97)
