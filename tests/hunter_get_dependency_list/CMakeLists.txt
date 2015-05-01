# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterGetDependencyList)

include(hunter_get_dependency_list)
include(hunter_process_dependency_node)
include(hunter_register_dependency)

function(expected_empty x)
  string(COMPARE EQUAL "${x}" "" is_empty)
  if(NOT is_empty)
    message(FATAL_ERROR "Expected empty, bug got: ${x}")
  endif()
endfunction()

function(expected_equal x y)
  if(NOT ${ARGC} EQUAL 2)
    message(FATAL_ERROR "")
  endif()
  string(COMPARE EQUAL "${x}" "${y}" is_equal)
  if(NOT is_equal)
    message(FATAL_ERROR "x:\n  ${x}\nis not equal:\n  ${y}")
  endif()
endfunction()

### Test empty
set(toolchain_id "${CMAKE_CURRENT_BINARY_DIR}/toolchain-id")
set(package_name "Foo")

set(HUNTER_TOOLCHAIN_ID_PATH "${toolchain_id}")
set(HUNTER_PACKAGE_NAME "${package_name}")

set(home "${toolchain_id}/Build/${package_name}")
file(WRITE "${home}/cache.sha1" "abc")

hunter_get_dependency_list(dep_list)
expected_empty("${dep_list}")

### Complex

file(REMOVE_RECURSE "${toolchain_id}")

set(package_name "J")
set(HUNTER_PACKAGE_NAME "${package_name}")

file(WRITE "${toolchain_id}/Build/A/cache.sha1" "A-SHA1")
file(WRITE "${toolchain_id}/Build/B/cache.sha1" "B-SHA1")
file(WRITE "${toolchain_id}/Build/C/cache.sha1" "C-SHA1")
file(WRITE "${toolchain_id}/Build/D/__E/cache.sha1" "D-E-SHA1")
file(WRITE "${toolchain_id}/Build/F/__G/cache.sha1" "F-G-SHA1")
file(WRITE "${toolchain_id}/Build/H/cache.sha1" "H-SHA1")
file(WRITE "${toolchain_id}/Build/I/cache.sha1" "I-SHA1")
file(WRITE "${toolchain_id}/Build/J/cache.sha1" "J-SHA1")

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

hunter_get_dependency_list(dep_list)

set(
    level_0
    "B B-SHA1"
    "D E D-E-SHA1"
    "H H-SHA1"
    "I I-SHA1"
)

set(
    level_1
    "A A-SHA1"
    "F G F-G-SHA1"
)

set(level_2 "C C-SHA1")

expected_equal("${dep_list}" "${level_0};${level_1};${level_2}")
