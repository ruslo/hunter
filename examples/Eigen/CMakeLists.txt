# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-eigen)

# DOCUMENTATION_START {
hunter_add_package(Eigen)
find_package(Eigen3 CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo Eigen3::Eigen)
# DOCUMENTATION_END }

# Test double library creation
find_package(Eigen3 CONFIG REQUIRED)

string(COMPARE EQUAL "${Eigen_LICENSES}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "Licenses not found")
endif()

message("Eigen licenses:")
foreach(x ${Eigen_LICENSES})
  message("* ${x}")
  if(NOT EXISTS "${Eigen_LICENSES}")
    message(FATAL_ERROR "File not found")
  endif()
endforeach()
