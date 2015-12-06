# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-half)

# download half
hunter_add_package(half)

# now half can be used
find_package(half CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo half::half)
