# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterCheckToolchainDefinition)

# We should call at least one 'hunter_add_package' to trigger toolchain-id
# calculation
hunter_add_package(Sugar)

include(hunter_check_toolchain_definition)

hunter_check_toolchain_definition(
    NAME __cplusplus
    DEFINED is_defined
    VALUE value
)

if(NOT is_defined)
  message(FATAL_ERROR "Not defined")
endif()

string(COMPARE EQUAL "${value}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "Is empty")
endif()

hunter_check_toolchain_definition(
    NAME __this_is_not_a_macro
    DEFINED is_defined
    VALUE value
)

if(is_defined)
  message(FATAL_ERROR "Is defined")
endif()

string(COMPARE EQUAL "${value}" "" is_empty)
if(NOT is_empty)
  message(FATAL_ERROR "Not empty: '${value}'")
endif()
