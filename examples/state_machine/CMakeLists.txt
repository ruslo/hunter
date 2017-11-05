# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-state_machine)

hunter_add_package(state_machine)
find_package(state_machine CONFIG REQUIRED)

add_executable(sm foo.cpp)
target_link_libraries(sm state_machine)
