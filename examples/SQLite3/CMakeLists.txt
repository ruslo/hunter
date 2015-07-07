# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-SQLite3)

hunter_add_package(SQLite3)
find_package(SQLite3 REQUIRED)

if(NOT TARGET SQLite3)
  message(FATAL_ERROR "No SQLite3 target")
endif()
