# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)
project(download-tiff)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

# download gtest
hunter_add_package(TIFF)

# now gtest can be used
find_package(TIFF CONFIG REQUIRED)

add_executable(foo main.c)
target_link_libraries(foo TIFF::libtiff)
