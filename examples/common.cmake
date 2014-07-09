# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

get_filename_component(HUNTER_SELF "${CMAKE_CURRENT_LIST_DIR}/.." ABSOLUTE)
list(APPEND CMAKE_MODULE_PATH "${HUNTER_SELF}/cmake/modules")

# default generator info
# (before master file, otherwise generator will be placed in "normal" location)
set(HUNTER_BASE "${PROJECT_BINARY_DIR}/_3rdParty/_hunter_base")
set(HUNTER_INSTALL_TAG "_testing")
include(hunter_set_cmake_default_generator)
hunter_set_cmake_default_generator()

include("${HUNTER_SELF}/cmake/Hunter")

# rewrite base for testing
set(HUNTER_BASE "${PROJECT_BINARY_DIR}/_3rdParty/_hunter_base")
