# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-odb)

hunter_add_package(odb)
find_package(odb REQUIRED)

if(NOT TARGET odb)
  message(FATAL_ERROR "No target odb")
endif()
