# Copyright (c) 2016-2018, Ruslan Baratov
# Copyright (c) 2018, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-GPUImage)

hunter_add_package(GPUImage)
find_package(GPUImage CONFIG REQUIRED)

if(NOT TARGET GPUImage::gpuimage)
  message(FATAL_ERROR "Target not found")
endif()

if(APPLE)
  add_executable(foo foo.mm)
  target_link_libraries(foo GPUImage::gpuimage)
endif()
