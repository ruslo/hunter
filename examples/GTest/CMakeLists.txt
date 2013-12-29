# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8.8)
project(download-gtest)

# Let hunter be more verbose
set(HUNTER_STATUS_DEBUG ON CACHE BOOL "")

# emulate ${HUNTER_ROOT}/Source/cmake/Hunter
include("../common.cmake")
include(hunter_add_package)

# download gtest
hunter_add_package(GTest)

# now gtest can be used
find_package(GTest REQUIRED)

if(NOT GTEST_BOTH_LIBRARIES)
  message(FATAL_ERROR "gtest libraries not found")
else()
  message("gtest libs: ${GTEST_BOTH_LIBRARIES}")
endif()
