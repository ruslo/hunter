# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-openddlparser)

# download openddlparser
hunter_add_package(openddlparser)

# now openddlparser can be used
find_package(openddlparser CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo openddlparser::openddl_parser)
