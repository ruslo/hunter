# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-zlib)

# DOCUMENTATION_START {
hunter_add_package(ZLIB)
find_package(ZLIB CONFIG REQUIRED)

add_executable(boo main.c)
target_link_libraries(boo PRIVATE ZLIB::zlib)
# DOCUMENTATION_END }

# DOCUMENTATION_START_1 {
add_executable(baz main.c)
target_link_libraries(baz PRIVATE ZLIB::ZLIB)
# DOCUMENTATION_END_1 }
