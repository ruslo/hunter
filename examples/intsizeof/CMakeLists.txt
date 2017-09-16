# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-intsizeof)

hunter_add_package(intsizeof)
find_package(intsizeof CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo intsizeof::intsizeof)
