# Copyright (c) 2016 Alexey Ulyanov
# All rights reserved.

cmake_minimum_required(VERSION 3.0.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Catch)
set(CMAKE_CXX_STANDARD 98)

hunter_add_package(Catch)

find_package(Catch CONFIG REQUIRED)

set(SOURCES main.cpp
            foo_test.cpp
            foo.cpp)
set(HEADERS foo.hpp)

add_executable(foo_test ${SOURCES} ${HEADERS})
target_link_libraries(foo_test PUBLIC Catch::Catch)

enable_testing(true)
add_test(NAME foo_test COMMAND foo_test)
