# Copyright (c) 2016, Alexander Lamaison
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-hunter-wtl)

hunter_add_package(WTL)

find_package(WTL CONFIG REQUIRED)

add_executable(Alpha WIN32 Alpha.cpp Alpha.rc stdafx.cpp)
target_link_libraries(Alpha WTL::WTL)
