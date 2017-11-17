# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-inja)

hunter_add_package(inja)
find_package(inja CONFIG REQUIRED)

add_executable(inja inja.cpp)
target_link_libraries(inja inja::inja)
