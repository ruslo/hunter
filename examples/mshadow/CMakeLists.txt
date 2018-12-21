# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-mshadow)

# DOCUMENTATION_START {
enable_language(CUDA)
include_directories(${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})

hunter_add_package(mshadow)
find_package(mshadow CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC mshadow::mshadow)
# DOCUMENTATION_END }
