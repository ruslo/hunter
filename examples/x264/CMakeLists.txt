# Copyright (c) 2017, Alexandre Pretyman

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(x264-example)

# DOCUMENTATION_START {
hunter_add_package(x264)
find_package(x264 CONFIG REQUIRED)

add_executable(boo example.c)
target_link_libraries(boo PRIVATE PkgConfig::x264)
# DOCUMENTATION_END }
