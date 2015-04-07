# Copyright (c) 2014, Ruslan Baratov
# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

cmake_minimum_required(VERSION 3.0)
project(example-hunter-expat)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

hunter_add_package(Expat)

find_package(EXPAT REQUIRED)

add_executable(outline outline.c)
target_compile_definitions(outline PRIVATE XML_STATIC)
target_link_libraries(outline PRIVATE ${EXPAT_LIBRARIES})
target_include_directories(outline PRIVATE ${EXPAT_INCLUDE_DIRS})

add_executable(elements elements.c)
target_compile_definitions(elements PRIVATE XML_STATIC)
target_link_libraries(elements PRIVATE ${EXPAT_LIBRARIES})
target_include_directories(elements PRIVATE ${EXPAT_INCLUDE_DIRS})
