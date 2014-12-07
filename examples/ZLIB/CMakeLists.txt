# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)
project(download-zlib)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

# download gtest
hunter_add_package(ZLIB)

# now gtest can be used
find_package(ZLIB CONFIG REQUIRED)

add_executable(foo main.c)
target_link_libraries(foo ZLIB::zlib)
