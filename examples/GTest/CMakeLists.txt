# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-gtest)

# download gtest
hunter_add_package(GTest)

if(NOT EXISTS "${GTest_LICENSES}")
  message(FATAL_ERROR "File not found: '${GTest_LICENSES}")
endif()

message("License file: '${GTest_LICENSES}'")

# now gtest can be used
find_package(GTest CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo GTest::main)

find_package(GMock CONFIG REQUIRED)
if(NOT TARGET GMock::main)
  message(FATAL_ERROR "Target GMock::main not exists")
endif()
