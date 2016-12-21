# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-flatbuffers)

# download flatbuffers
hunter_add_package(flatbuffers)

# now flatbuffers can be used
find_package(flatbuffers CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo flatbuffers::flatbuffers)
