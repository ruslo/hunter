# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-kNet)

hunter_add_package(kNet)
find_package(kNet CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC kNet::kNet)
