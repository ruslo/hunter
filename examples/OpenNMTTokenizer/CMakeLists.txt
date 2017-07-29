# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(foo)

hunter_add_package(OpenNMTTokenizer)
find_package(OpenNMTTokenizer CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo OpenNMTTokenizer::OpenNMTTokenizer)
