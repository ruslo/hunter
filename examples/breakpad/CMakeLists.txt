# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.6)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-breakpad)

# DOCUMENTATION_START {
hunter_add_package(breakpad)
find_package(breakpad CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC breakpad::libbreakpad)
# DOCUMENTATION_END }
