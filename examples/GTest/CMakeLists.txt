# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(download-gtest)

# Retrieve package GTest
# The package contains the targets GTest::gtest, GTest::main, GMock::gmock and GMock::main.
# GTest provides basic testing functionality.
# GMock provides a mock framework that works together with GTest.
# The difference between the main and non-main targets is that the main targets provide
# a default implementation of the main() function.
hunter_add_package(GTest)

# Create test executable that only uses GTest.
find_package(GTest CONFIG REQUIRED)
add_executable(GTestExe useGTest.cpp)
target_link_libraries(GTestExe GTest::main)

# Create test executable uses GMock and a custom main function.
# Note that GMock also includes GTest so we do not need to link to GTest explicitly
find_package(GMock CONFIG REQUIRED)
add_executable(GMockExe useGMock.cpp)
target_link_libraries(GMockExe GMock::gmock)
