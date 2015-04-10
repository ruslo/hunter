# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-comet)

hunter_add_package(Comet)

find_package(Comet CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo Comet::comet)
