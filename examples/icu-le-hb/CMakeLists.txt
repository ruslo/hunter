# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-icu-le-hb)

# DOCUMENTATION_START {
hunter_add_package(icu-le-hb)
find_package(icu-le-hb CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC icu-le-hb::icu-le-hb)
# DOCUMENTATION_END }
