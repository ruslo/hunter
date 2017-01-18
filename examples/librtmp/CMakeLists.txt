# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-librtmp)

hunter_add_package(librtmp)
find_package(librtmp CONFIG REQUIRED)

add_executable(librtmp_example main.cpp)
target_link_libraries(librtmp_example librtmp::librtmp)

