# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-LodePNG)

# DOCUMENTATION_START {
hunter_add_package(LodePNG)
find_package(LodePNG CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC LodePNG::lodepng)
# DOCUMENTATION_END }
