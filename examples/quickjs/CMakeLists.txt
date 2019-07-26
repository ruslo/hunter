# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-quickjs)

# DOCUMENTATION_START {
hunter_add_package(quickjs)
find_package(quickjs CONFIG REQUIRED)

add_executable(run-test262 run-test262.c)
target_link_libraries(run-test262 PRIVATE quickjs::quickjs)
# DOCUMENTATION_END }

include(CheckLibraryExists)
check_library_exists(m "pow" "" __math_system_library)

if(__math_system_library)
  target_link_libraries(run-test262 PRIVATE m)
endif()

target_link_libraries(run-test262 PRIVATE ${CMAKE_DL_LIBS})

find_package(Threads REQUIRED)
target_link_libraries(run-test262 PRIVATE Threads::Threads)
