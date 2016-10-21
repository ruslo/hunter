# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.1)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(download-gtest)

# download gtest
hunter_add_package(GTest)

# Use package GTest if only GTest is required
# find_package(GTest CONFIG REQUIRED)

# Packag GMock includes GTest so only use this when you need both
find_package(GMock CONFIG REQUIRED)   

add_executable(foo foo.cpp)
target_link_libraries(foo GMock::main)
