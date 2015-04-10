# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-clapack)

# download gtest
hunter_add_package(CLAPACK)

# now gtest can be used
find_package(CLAPACK CONFIG REQUIRED)

add_executable(foo main.c)
target_link_libraries(foo CLAPACK::lapack)
