# Copyright (c) 2016-2018, Ruslan Baratov
# Copyright (c) 2018, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-GPUImage)

# DOCUMENTATION_START {
hunter_add_package(GPUImage)
find_package(GPUImage CONFIG REQUIRED)

add_executable(foo foo.mm)
target_link_libraries(foo PUBLIC GPUImage::gpuimage)
# DOCUMENTATION_END }
