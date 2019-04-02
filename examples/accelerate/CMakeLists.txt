# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-accelerate)

find_package(accelerate REQUIRED)

add_executable(foo foo.mm)
target_link_libraries(foo PUBLIC accelerate::accelerate)
