# Copyright (c) 2016, Alexandre Pretyman
cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(libxml2-example)

# DOCUMENTATION_START {
hunter_add_package(libxml2)
find_package(libxml-2.0 CONFIG REQUIRED)

add_executable(boo main.c)
target_link_libraries(boo PRIVATE PkgConfig::libxml-2.0)
# DOCUMENTATION_END }

include(CheckLibraryExists)
check_library_exists(m "pow" "" __math_system_library)
if(__math_system_library)
  set_property(
      TARGET
      PkgConfig::libxml-2.0
      APPEND
      PROPERTY
      INTERFACE_LINK_LIBRARIES m
  )
endif()
