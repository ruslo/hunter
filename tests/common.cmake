# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

if(NOT HUNTER_ROOT)
  message(FATAL_ERROR "Expected HUNTER_ROOT")
endif()

include("${HUNTER_ROOT}/cmake/Hunter")
include(hunter_add_package)
