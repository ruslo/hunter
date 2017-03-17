# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ogles_gpgpu)

# download ogles_gpgpu
hunter_add_package(ogles_gpgpu)

# now ogles_gpgpu can be used
find_package(ogles_gpgpu CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo ogles_gpgpu::ogles_gpgpu)
