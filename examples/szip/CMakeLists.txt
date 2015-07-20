# Copyright (c) 2015, Oliver Daniell
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-szip)

hunter_add_package(szip)

find_package(szip REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo szip::szip)
