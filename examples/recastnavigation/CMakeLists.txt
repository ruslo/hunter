# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-recastnavigation)

hunter_add_package(recastnavigation)
find_package(recastnavigation CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(
    boo
    PUBLIC
    recastnavigation::detour
    recastnavigation::detour_crowd
    recastnavigation::detour_tile_cache
    recastnavigation::recast
)
