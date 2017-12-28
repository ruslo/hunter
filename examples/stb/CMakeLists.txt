# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-stb)

hunter_add_package(stb)
find_package(stb CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC stb::stb)
