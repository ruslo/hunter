# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-GBenchmark)

# download GBenchmark
hunter_add_package(GBenchmark)

find_package(GBenchmark REQUIRED)

add_executable(benchmark main.cpp)
target_link_libraries(benchmark google::benchmark)
