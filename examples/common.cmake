# Copyright (c) 2013, 2015 Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

### Include HunterGate module from git submodule
set(gate_dir "${CMAKE_CURRENT_LIST_DIR}/../gate")
set(gate_module "${gate_dir}/cmake/HunterGate.cmake")

if(NOT EXISTS "${gate_module}")
  message(
      FATAL_ERROR
      "${gate_module} module not found (update git submodule needed?)"
  )
endif()

include("${gate_module}")

### Check testing variables are set
string(COMPARE EQUAL "${TESTING_URL}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "TESTING_URL variable is empty (see jenkins.py script)")
endif()

string(COMPARE EQUAL "${TESTING_SHA1}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "TESTING_SHA1 variable is empty (see jenkins.py script)")
endif()

string(COMPARE EQUAL "${HUNTER_ROOT}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "HUNTER_ROOT variable is empty (see jenkins.py script)")
endif()

### HunterGate module
HunterGate(
    URL "${TESTING_URL}"
    SHA1 "${TESTING_SHA1}"
)
