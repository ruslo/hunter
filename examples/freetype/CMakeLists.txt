# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-freetype)

# DOCUMENTATION_START {
hunter_add_package(freetype)
find_package(freetype CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PRIVATE freetype::freetype)
# DOCUMENTATION_END }

# DOCUMENTATION_START_1 {
add_executable(baz boo.cpp)
target_link_libraries(baz PRIVATE Freetype::Freetype)
# DOCUMENTATION_END_1 }
