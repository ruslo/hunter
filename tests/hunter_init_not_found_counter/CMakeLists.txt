# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterHunterInitNotFoundCounter)

include(hunter_init_not_found_counter)

###
set(HUNTER_USE_CACHE_SERVERS YES)
hunter_init_not_found_counter(NEEDED counter 1)
string(COMPARE EQUAL "${NEEDED}" "2" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Unexpected: ${NEEDED}")
endif()
string(COMPARE EQUAL "${counter}" "0" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Unexpected: ${counter}")
endif()

###
set(HUNTER_USE_CACHE_SERVERS ONLY)
hunter_init_not_found_counter(NEEDED counter 1)
string(COMPARE EQUAL "${NEEDED}" "4" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Unexpected: ${NEEDED}")
endif()
string(COMPARE EQUAL "${counter}" "0" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Unexpected: ${counter}")
endif()

###
set(HUNTER_USE_CACHE_SERVERS ONLY)
hunter_init_not_found_counter(NEEDED counter 3)
string(COMPARE EQUAL "${NEEDED}" "12" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Unexpected: ${NEEDED}")
endif()
string(COMPARE EQUAL "${counter}" "0" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Unexpected: ${counter}")
endif()

###
message("PASSED")
