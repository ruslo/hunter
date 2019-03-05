# Copyright (c) 2016, Alexandre Pretyman
cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(libxml2-example)

# DOCUMENTATION_START {
hunter_add_package(libxml2)
find_package(libxml2 CONFIG REQUIRED)

add_executable(boo main.c)

include_directories(${LIBXML2_INCLUDE_DIRS})
target_link_libraries(boo ${LIBXML2_LIBRARIES})
# DOCUMENTATION_END }
