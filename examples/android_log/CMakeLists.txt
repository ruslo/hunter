# Copyright (c) 2013-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-android_log)

find_package(android_log REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC android_log::android_log)
