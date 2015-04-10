# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-gtest)

# download gtest
hunter_add_package(GTest)

# now gtest can be used
find_package(GTest CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo GTest::main)
