# Copyright (c) 2013, 2015, 2019 Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

### Include HunterGate module from git submodule
set(gate_dir "${CMAKE_CURRENT_LIST_DIR}/../gate")
set(gate_module "${gate_dir}/cmake/HunterGate.cmake")

get_filename_component(gate_module "${gate_module}" ABSOLUTE)
if(NOT EXISTS "${gate_module}")
  message(
      FATAL_ERROR
      "${gate_module} module not found (update git submodule needed?)"
  )
endif()

message("Including HunterGate: ${gate_module}")
include("${gate_module}")

set(
    error_message
    "Are you using jenkins.py script for testing?
    Please check:
    - https://docs.hunter.sh/en/latest/creating-new/create/cmake.html#testing-locally"
)

### Check testing variables are set
if("${TESTING_URL}" STREQUAL "")
  message(FATAL_ERROR "TESTING_URL is empty. ${error_message}")
endif()

if("${TESTING_SHA1}" STREQUAL "")
  message(FATAL_ERROR "TESTING_SHA1 is empty. ${error_message}")
endif()

if("${HUNTER_ROOT}" STREQUAL "")
  message(FATAL_ERROR "HUNTER_ROOT is empty. ${error_message}")
endif()

get_filename_component(TESTING_URL "${TESTING_URL}" ABSOLUTE)

### HunterGate module
HunterGate(URL "${TESTING_URL}" SHA1 "${TESTING_SHA1}" ${TESTING_CONFIG_OPT})
