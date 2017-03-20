# Copyright (c) 2016 Alexey Ulyanov
# All rights reserved.

cmake_minimum_required(VERSION 3.0.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-FakeIt)
set(CMAKE_CXX_STANDARD 11)

hunter_add_package(FakeIt)

find_package(FakeIt CONFIG REQUIRED)

set(SOURCES fakeit_test.cpp)

add_executable(fakeit_test ${SOURCES})
target_link_libraries(fakeit_test PRIVATE FakeIt::FakeIt)

enable_testing()
add_test(NAME fakeit_test COMMAND fakeit_test)
