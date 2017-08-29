# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-xcb)

# download xcb
hunter_add_package(xcb)
find_package(xcb CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC PkgConfig::xcb)
