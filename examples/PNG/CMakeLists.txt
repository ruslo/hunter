# Copyright (c) 2014, Ruslan Baratov
# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

cmake_minimum_required(VERSION 3.0)
project(example-hunter-png)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

hunter_add_package(PNG)

find_package(PNG REQUIRED)

add_executable(foo main.cpp)
target_compile_definitions(foo PRIVATE ${PNG_DEFINITIONS})
target_include_directories(foo PRIVATE ${PNG_INCLUDE_DIRS})
target_link_libraries(foo PRIVATE ${PNG_LIBRARIES})
