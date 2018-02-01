# Copyright (c) 2013-2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost)
find_package(Boost CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::boost)
