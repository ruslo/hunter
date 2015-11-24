# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-asyncpp)

# download Async++
hunter_add_package(Async++)

# now Async++ can be used
find_package(Async++ CONFIG REQUIRED)

set(CMAKE_CXX_STANDARD 11)
set(CXX_STANDARD_REQUIRED ON)
add_executable(asyncpp asyncpp.cpp)
target_link_libraries(asyncpp Async++::Async++)
