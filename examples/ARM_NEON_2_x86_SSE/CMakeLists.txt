# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ARM_NEON_2_x86_SSE)

# download boost.compute
hunter_add_package(ARM_NEON_2_x86_SSE)

# now boost.compute can be used
find_package(ARM_NEON_2_x86_SSE CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo ARM_NEON_2_x86_SSE::ARM_NEON_2_x86_SSE)
