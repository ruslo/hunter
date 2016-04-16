# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost-compute)

# download boost.compute
hunter_add_package(BoostCompute)

# now boost.compute can be used
find_package(BoostCompute CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo BoostCompute::boost_compute)
