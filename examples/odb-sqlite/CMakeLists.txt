# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-odb-sqlite)

hunter_add_package(odb-sqlite)
find_package(odb REQUIRED sqlite)

if(NOT TARGET odb::sqlite)
  message(FATAL_ERROR "No target odb::sqlite")
endif()
