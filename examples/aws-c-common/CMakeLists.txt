# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-aws-c-common)

# DOCUMENTATION_START {
hunter_add_package(aws-c-common)

find_package(aws-c-common CONFIG REQUIRED)
# To use exported modules
include(AwsSIMD)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC AWS::aws-c-common)
# DOCUMENTATION_END }
