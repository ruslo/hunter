# Copyright (c) 2016 Alexey Ulyanov
# All rights reserved.

cmake_minimum_required(VERSION 3.0.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Catch)

hunter_add_package(Catch)

# DOCUMENTATION_START {
find_package(Catch2 CONFIG REQUIRED)

set(SOURCES main.cpp
            foo_test.cpp
            foo.cpp)
set(HEADERS foo.hpp)

add_executable(foo_test ${SOURCES} ${HEADERS})
target_link_libraries(foo_test PUBLIC Catch2::Catch2)
# DOCUMENTATION_END }
