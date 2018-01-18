# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-dlib)

# DOCUMENTATION_START {
hunter_add_package(dlib)
find_package(dlib CONFIG REQUIRED)

add_executable(bayes_net_ex bayes_net_ex.cpp)
target_link_libraries(bayes_net_ex PUBLIC dlib::dlib)
# DOCUMENTATION_END }

if(NOT EXISTS "${dlib_LICENSES}")
  message(FATAL_ERROR "File not found: '${dlib_LICENSES}'")
else()
  message("License: '${dlib_LICENSES}'")
endif()
