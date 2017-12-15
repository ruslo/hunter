# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost-compute)

hunter_add_package(BoostCompute)
find_package(BoostCompute CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC BoostCompute::boost_compute)
