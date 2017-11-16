# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cpr)

hunter_add_package(cpr)
find_package(cpr CONFIG REQUIRED)

add_executable(cpr_example example.cpp)
target_link_libraries(cpr_example cpr::cpr)
