# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-tiff)

# download gtest
hunter_add_package(TIFF)

# now gtest can be used
find_package(TIFF CONFIG REQUIRED)

add_executable(foo main.c)
target_link_libraries(foo TIFF::libtiff)

# Compatibility mode
find_package(TIFF REQUIRED)

string(COMPARE EQUAL "${TIFF_INCLUDE_DIR}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "Expected non-empty")
endif()

string(COMPARE EQUAL "${TIFF_LIBRARIES}" "TIFF::libtiff" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Expected TIFF::libtiff but got: ${TIFF_LIBRARIES}")
endif()

include_directories(${TIFF_INCLUDE_DIR})
target_link_libraries(foo ${TIFF_LIBRARIES})
