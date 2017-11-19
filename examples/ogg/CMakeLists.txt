# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ogg)

hunter_add_package(ogg)
find_package(ogg CONFIG REQUIRED)

add_executable(ogg ogg.cpp)
target_link_libraries(ogg ogg::ogg)
