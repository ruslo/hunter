# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
set(HUNTER_RECIPE_DIRS "${CMAKE_SOURCE_DIR}/recipes")
set(HUNTER_CONFIGURATION_TYPES Debug)
include("${CMAKE_SOURCE_DIR}/../../../examples/common.cmake")
project(external-bar)


hunter_add_package(BooBoo)
find_package(Eigen REQUIRED)
if(NOT TARGET Eigen::eigen)
  message(FATAL_ERROR "Eigen target not found")
endif()
get_target_property(EIGEN_INCLUDE_DIR Eigen::eigen INTERFACE_INCLUDE_DIRECTORIES)
file(WRITE "${PROJECT_BINARY_DIR}/root" ${EIGEN_INCLUDE_DIR})
