# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-corrade)

set(_CORRADE_LIBRARY_COMPONENTS Containers Interconnect PluginManager TestSuite Utility)

hunter_add_package(corrade)

find_package(Corrade CONFIG REQUIRED COMPONENTS ${_CORRADE_LIBRARY_COMPONENTS})

message("CORRADE_INCLUDE_DIR: ${CORRADE_INCLUDE_DIR}")
message("CORRADE_LIB_SUFFIX_MODULE: ${CORRADE_LIB_SUFFIX_MODULE}")

foreach(_component ${_CORRADE_LIBRARY_COMPONENTS})
    string(TOUPPER ${_component} _COMPONENT)
    message("CORRADE_${_COMPONENT}_LIBRARY_DEBUG: ${CORRADE_${_COMPONENT}_LIBRARY_DEBUG}")
    message("CORRADE_${_COMPONENT}_LIBRARY_RELEASE: ${CORRADE_${_COMPONENT}_LIBRARY_RELEASE}")
endforeach()

add_executable(foo foo.cpp)
target_link_libraries(foo PRIVATE
  Corrade::Containers
  Corrade::Interconnect
  Corrade::PluginManager
  Corrade::TestSuite
  Corrade::Utility
  )
