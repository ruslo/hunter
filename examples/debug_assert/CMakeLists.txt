# Copyright (c) 2016 Alexey Ulyanov
# All rights reserved.

cmake_minimum_required(VERSION 3.0.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-debug_assert)
set(CMAKE_CXX_STANDARD 11)

hunter_add_package(debug_assert)

find_package(debug_assert CONFIG REQUIRED)

set(SOURCES main.cpp)

add_executable(debug_assert_example ${SOURCES})
target_link_libraries(debug_assert_example PUBLIC debug_assert)
