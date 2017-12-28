# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost COMPONENTS system thread)
find_package(Boost CONFIG REQUIRED system thread)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::system Boost::thread)
