# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterGetPackageDepsRecurse)

include(hunter_get_package_deps_recurse)
include(hunter_register_dependency)

set(config_id "${CMAKE_CURRENT_BINARY_DIR}/config-id")

set(HUNTER_CONFIG_ID_PATH "${config_id}")

file(MAKE_DIRECTORY "${config_id}/Build/A")
file(MAKE_DIRECTORY "${config_id}/Build/B")
file(MAKE_DIRECTORY "${config_id}/Build/C")
file(MAKE_DIRECTORY "${config_id}/Build/D/__E")
file(MAKE_DIRECTORY "${config_id}/Build/F/__G")
file(MAKE_DIRECTORY "${config_id}/Build/H")
file(MAKE_DIRECTORY "${config_id}/Build/I")
file(MAKE_DIRECTORY "${config_id}/Build/J")

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

hunter_get_package_deps_recurse(PACKAGE "J" RESULT result)

string(COMPARE EQUAL "A;B;C;D E;F G;H;I" "${result}" is_ok)

if(NOT is_ok)
  message(FATAL_ERROR "Unexpected list: ${result}")
endif()
