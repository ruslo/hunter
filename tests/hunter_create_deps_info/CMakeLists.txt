# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterCreateDepsInfo)

include(hunter_create_deps_info)
include(hunter_register_dependency)

function(run_check file1)
  string(COMPARE EQUAL "${temp_deps_info}" "" is_empty)
  if(is_empty)
    message(FATAL_ERROR "Variable is empty")
  endif()

  file(DIFFERENT diff FILES "${file1}" "${temp_deps_info}")

  if(diff)
    message(FATAL_ERROR "Files differ: ${file1} ${temp_deps_info}")
  else()
    message("Files same: ${file1} ${temp_deps_info}")
  endif()
endfunction()

### Test empty
set(config_id "${CMAKE_CURRENT_BINARY_DIR}/config-id")
set(package_name "Foo")
set(temp_deps_info "${CMAKE_CURRENT_BINARY_DIR}/deps.info-TEMP")

set(HUNTER_CONFIG_ID_PATH "${config_id}")
set(HUNTER_PACKAGE_NAME "${package_name}")

set(home "${config_id}/Build/${package_name}")
file(WRITE "${home}/cache.sha1" "abc")

hunter_create_deps_info("${temp_deps_info}")
run_check("${CMAKE_CURRENT_LIST_DIR}/empty.txt")

### Complex

file(REMOVE_RECURSE "${config_id}")

set(package_name "J")
set(HUNTER_PACKAGE_NAME "${package_name}")

file(WRITE "${config_id}/Build/A/cache.sha1" "A-SHA1")
file(WRITE "${config_id}/Build/B/cache.sha1" "B-SHA1")
file(WRITE "${config_id}/Build/C/cache.sha1" "C-SHA1")
file(WRITE "${config_id}/Build/D/__E/cache.sha1" "D-E-SHA1")
file(WRITE "${config_id}/Build/F/__G/cache.sha1" "F-G-SHA1")
file(WRITE "${config_id}/Build/H/cache.sha1" "H-SHA1")
file(WRITE "${config_id}/Build/I/cache.sha1" "I-SHA1")
file(WRITE "${config_id}/Build/J/cache.sha1" "J-SHA1")

hunter_register_dependency(
    PACKAGE "J"
    DEPENDS_ON_PACKAGE "F"
    DEPENDS_ON_COMPONENT "G"
)
hunter_register_dependency(
    PACKAGE "J"
    DEPENDS_ON_PACKAGE "B"
)
hunter_register_dependency(
    PACKAGE "J"
    DEPENDS_ON_PACKAGE "C"
)

hunter_register_dependency(
    PACKAGE "F;G"
    DEPENDS_ON_PACKAGE "H"
)

hunter_register_dependency(
    PACKAGE "C"
    DEPENDS_ON_PACKAGE "A"
)

hunter_register_dependency(
    PACKAGE "A"
    DEPENDS_ON_PACKAGE "I"
)

hunter_register_dependency(
    PACKAGE "C"
    DEPENDS_ON_PACKAGE "D"
    DEPENDS_ON_COMPONENT "E"
)

hunter_create_deps_info("${temp_deps_info}")
run_check("${CMAKE_CURRENT_LIST_DIR}/complex.txt")
