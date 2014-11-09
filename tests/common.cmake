# Copyright (c) 2013-2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

if(NOT HUNTER_ROOT)
  message(FATAL_ERROR "Expected HUNTER_ROOT")
endif()

include("${HUNTER_ROOT}/cmake/Hunter")
include(hunter_add_package)

get_filename_component(test_name "${CMAKE_PARENT_LIST_FILE}" DIRECTORY)
string(REPLACE "${HUNTER_ROOT}/" "" test_name "${test_name}")

message("Testing: ${test_name}")
