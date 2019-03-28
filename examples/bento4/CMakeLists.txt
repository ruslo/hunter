# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-bento4)

# DOCUMENTATION_START {
hunter_add_package(bento4)
find_package(bento4 CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC bento4::ap4)
# DOCUMENTATION_END }
