# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-arrayfire)

# download arrayfire
hunter_add_package(ArrayFire)

# now arrayfire can be used
find_package(ArrayFire CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo ArrayFire::af)
