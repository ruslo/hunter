# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-odb-compiler)

hunter_add_package(odb-compiler)
find_package(odb-compiler REQUIRED)

string(COMPARE EQUAL "${ODB_COMPILER}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "ODB_COMPILER is empty")
endif()
