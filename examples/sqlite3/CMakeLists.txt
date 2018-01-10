# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-sqlite3)

# DOCUMENTATION_START {
hunter_add_package(sqlite3)
find_package(sqlite3 CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC sqlite3::sqlite3)
# DOCUMENTATION_END }
