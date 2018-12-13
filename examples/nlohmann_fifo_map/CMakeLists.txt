# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-nlohmann_fifo_map)

# DOCUMENTATION_START {
hunter_add_package(nlohmann_fifo_map)
find_package(nlohmann_fifo_map CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC nlohmann_fifo_map::fifo_map)
# DOCUMENTATION_END }
