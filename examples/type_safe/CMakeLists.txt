# Copyright (c) 2016 Alexey Ulyanov
# All rights reserved.

cmake_minimum_required(VERSION 3.0.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-type_safe)
set(CMAKE_CXX_STANDARD 11)

hunter_add_package(type_safe)
find_package(type_safe CONFIG REQUIRED)

set(SOURCES main.cpp)

add_executable(type_safe_example ${SOURCES})
target_link_libraries(type_safe_example type_safe)
