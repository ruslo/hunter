# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(download-gtest)

# download gtest
hunter_add_package(GTest)

# Create test executable that only uses GTest.
find_package(GTest CONFIG REQUIRED)
add_executable(GTestExe useGTest.cpp)
target_link_libraries(GTestExe GTest::main)

# Create test executable that also uses GMock.
# Note that GMock also includes GTest so we do not need to link to GTest explicitly
find_package(GMock CONFIG REQUIRED)
add_executable(GMockExe useGMock.cpp)
target_link_libraries(GMockExe GMock::main)
