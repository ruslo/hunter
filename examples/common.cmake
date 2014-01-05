# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8.12)

get_filename_component(HUNTER_ROOT "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)
list(APPEND CMAKE_MODULE_PATH "${HUNTER_ROOT}/Source/cmake/modules")

# default generator info
# (before master file, otherwise generator will be placed in "normal" location)
set(HUNTER_BASE "${PROJECT_BINARY_DIR}/_hunter_base")
set(HUNTER_INSTALL_TAG "_testing")
include(hunter_set_cmake_default_generator)
hunter_set_cmake_default_generator()

include("${HUNTER_ROOT}/Source/cmake/Hunter")

# rewrite base for testing
set(HUNTER_BASE "${PROJECT_BINARY_DIR}/_hunter_base")
