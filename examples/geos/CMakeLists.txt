# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-geos)

hunter_add_package(geos)
find_package(geos)
add_executable(example-geos geos.cpp)
target_link_libraries(example-geos geos)
