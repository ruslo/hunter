# Copyright (c) 2014, Ruslan Baratov
# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-hunter-png)

hunter_add_package(PNG)

find_package(PNG CONFIG REQUIRED)

add_executable(foo main.cpp)
target_link_libraries(foo PNG::png)

# Compatibility mode
find_package(PNG REQUIRED)

string(COMPARE EQUAL "${PNG_INCLUDE_DIRS}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "Expected non-empty")
endif()

string(COMPARE EQUAL "${PNG_DEFINITIONS}" "" is_empty)
if(NOT is_empty)
  message(FATAL_ERROR "Expected empty")
endif()

string(COMPARE EQUAL "${PNG_LIBRARIES}" "PNG::png" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Expected PNG::png but got ${PNG_LIBRARIES}")
endif()

include_directories(${PNG_INCLUDE_DIRS})
target_link_libraries(foo ${PNG_LIBRARIES})
add_definitions(${PNG_DEFINITIONS})
