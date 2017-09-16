# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-aes)

hunter_add_package(aes)
find_package(aes CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo aes::aes)
