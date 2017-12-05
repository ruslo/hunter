# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cub)

# Test CMake cub installation, even if find_package(CUDA) fails
hunter_add_package(cub)
find_package(cub CONFIG REQUIRED)

if(NOT TARGET cub::cub)
  message(FATAL_ERROR "Target not found")
endif()

# Note: Enable CUDA setup for full test, i,e:
#
# find_package(CUDA QUIET REQUIRED)
# if (CUDA_FOUND)
#   cuda_add_executable(foo foo.cu)
#   target_link_libraries(foo cub::cub)
# endif()


