# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-tinyxml2)

# DOCUMENTATION_START {
hunter_add_package(tinyxml2)
find_package(tinyxml2 CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC tinyxml2)
# DOCUMENTATION_END }
