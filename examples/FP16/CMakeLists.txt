# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-FP16)

# DOCUMENTATION_START {
hunter_add_package(FP16)
find_package(FP16 REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC FP16::fp16)
# DOCUMENTATION_END }
