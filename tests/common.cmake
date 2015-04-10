# Copyright (c) 2013-2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

get_filename_component(HUNTER_ROOT "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)
list(APPEND CMAKE_MODULE_PATH "${HUNTER_ROOT}/cmake/modules")

get_filename_component(test_name "${CMAKE_PARENT_LIST_FILE}" DIRECTORY)
string(REPLACE "${HUNTER_ROOT}/" "" test_name "${test_name}")

message("Testing: ${test_name}")
