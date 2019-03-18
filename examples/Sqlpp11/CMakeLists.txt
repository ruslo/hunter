# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-sqlpp11)

# DOCUMENTATION_START {
hunter_add_package(Sqlpp11)
find_package(Sqlpp11 CONFIG REQUIRED)

add_executable(example example.cpp)
target_link_libraries(example sqlpp11)
# DOCUMENTATION_END }

