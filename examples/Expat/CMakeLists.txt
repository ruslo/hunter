# Copyright (c) 2014, Ruslan Baratov
# Copyright (c) 2015, 2016, Alexander Lamaison
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-hunter-expat)

hunter_add_package(Expat)

find_package(EXPAT CONFIG REQUIRED)

add_executable(outline outline.c)
target_link_libraries(outline PRIVATE EXPAT::expat)

find_package(EXPAT MODULE REQUIRED)

add_executable(elements elements.c)
target_compile_definitions(elements PRIVATE XML_STATIC)
target_link_libraries(elements PRIVATE ${EXPAT_LIBRARIES})
target_include_directories(elements PRIVATE ${EXPAT_INCLUDE_DIRS})
