# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-proj4)

# DOCUMENTATION_START {
hunter_add_package(PROJ4)
find_package(PROJ4 CONFIG REQUIRED)

add_executable(hello-proj4 hello-proj4.cpp)
target_link_libraries(hello-proj4 PUBLIC proj)
# DOCUMENTATION_END }
