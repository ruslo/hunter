# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-poly2tri)

# download poly2tri
hunter_add_package(poly2tri)

# now poly2tri can be used
find_package(poly2tri CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo poly2tri::poly2tri)
