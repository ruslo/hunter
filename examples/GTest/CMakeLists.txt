# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-gtest)

add_executable(foo foo.cpp)

hunter_add_package(GTest)
find_package(GTest CONFIG REQUIRED)
target_link_libraries(foo PUBLIC GTest::main)

find_package(GMock CONFIG REQUIRED)
target_link_libraries(foo PUBLIC GMock::gmock)

if(NOT EXISTS "${GTest_LICENSES}")
  message(FATAL_ERROR "File not found: '${GTest_LICENSES}")
endif()

message("License file: '${GTest_LICENSES}'")
