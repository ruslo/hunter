# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8.8)

get_filename_component(HUNTER_ROOT "${CMAKE_CURRENT_LIST_DIR}/.." ABSOLUTE)
include("${HUNTER_ROOT}/cmake/Hunter")

# rewrite base for testing
set(HUNTER_BASE ${PROJECT_BINARY_DIR}/_hunter_base)
