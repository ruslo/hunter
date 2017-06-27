# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-F2C)

# download F2C
hunter_add_package(F2C)

find_package(F2C REQUIRED)

add_executable(amos main.cpp amos.c fortran.c)
target_link_libraries(amos f2c::f2c)
