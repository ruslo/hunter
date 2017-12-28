# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-gemmlowp)

hunter_add_package(gemmlowp)
find_package(gemmlowp CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo gemmlowp::gemmlowp)
