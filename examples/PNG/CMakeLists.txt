# Copyright (c) 2014, Ruslan Baratov
# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-hunter-png)

# DOCUMENTATION_START {
hunter_add_package(PNG)
find_package(PNG CONFIG REQUIRED)

add_executable(boo main.cpp)
target_link_libraries(boo PRIVATE PNG::png)
# DOCUMENTATION_END }

# DOCUMENTATION_START_1 {
add_executable(baz main.cpp)
target_link_libraries(baz PRIVATE PNG::PNG)
# DOCUMENTATION_END_1 }
