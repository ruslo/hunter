# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-getopt)

if(MSVC)
    hunter_add_package(getopt)
    find_package(getopt CONFIG REQUIRED)

    set(getopt_example_libraries getopt::getopt)
endif()

add_executable(getopt_example main.cpp)
target_link_libraries(getopt_example ${getopt_example_libraries})

