# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-eigen)

hunter_add_package(Eigen)

find_package(Eigen REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo Eigen::eigen)
