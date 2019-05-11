# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost)
find_package(Boost CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::boost)

set(project_license "${CMAKE_CURRENT_BINARY_DIR}/LICENSE.txt")
file(
    WRITE
    "${project_license}"
    "Some info about this project license.\n\n"
)

string(COMPARE EQUAL "${Boost_LICENSES}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "No licenses")
endif()

file(APPEND "${project_license}" "== 3rd party licenses ==\n\n")

foreach(x ${Boost_LICENSES})
  file(READ "${x}" content)
  get_filename_component(license_name "${x}" NAME)
  file(APPEND "${project_license}" "== Boost (${license_name}) ==\n\n")
  file(APPEND "${project_license}" "${content}")
endforeach()

message("Project license: ${project_license}")

file(GLOB_RECURSE boost_configs "${BOOST_ROOT}/*/BoostConfig.cmake")
list(LENGTH boost_configs len)
if(NOT len EQUAL "1")
  message(FATAL_ERROR "More than one *Config: ${boost_configs}")
endif()
