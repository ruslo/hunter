# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-clblas)

# download clblas
hunter_add_package(clBLAS)

# now clblas can be used
find_package(clBLAS CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo clBLAS::clBLAS)
