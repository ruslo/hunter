# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-vorbis)

# DOCUMENTATION_START {
hunter_add_package(vorbis)
find_package(vorbis CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC vorbis::vorbis)
# DOCUMENTATION_END }
