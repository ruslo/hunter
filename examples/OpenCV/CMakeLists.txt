# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-opencv)

hunter_add_package(OpenCV)
find_package(OpenCV REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PRIVATE ${OpenCV_LIBS})
