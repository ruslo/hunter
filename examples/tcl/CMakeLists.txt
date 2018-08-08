# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(test_tcl)

# DOCUMENTATION_START {
hunter_add_package(tcl)
find_package(tcl REQUIRED)

add_executable(tcl_test tcl_test.c)
target_link_libraries(tcl_test PUBLIC tcl::tcl)
# DOCUMENTATION_END }
