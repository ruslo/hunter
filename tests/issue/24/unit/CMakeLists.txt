cmake_minimum_required(VERSION 3.0)

include("../../../../examples/common.cmake")

project(TestIssue24Unit)

include(hunter_default_version)
include(hunter_cmake_args)
include(hunter_config)

set(__HUNTER_ALLOW_DEFAULT_VERSION_LOADING YES)
set(__HUNTER_ALLOW_CONFIG_LOADING YES)
hunter_default_version(Foo VERSION 1.0)
hunter_config(Foo VERSION 1.0 CMAKE_ARGS TEST=1)
hunter_cmake_args(Foo CMAKE_ARGS TEST=2)

list(GET __HUNTER_DEFAULT_CMAKE_ARGS_Foo -1 last_item_default)
if(NOT last_item_default STREQUAL "TEST=2")
  message(FATAL_ERROR
    "Expected last default CMAKE_ARGS to be the one set by hunter_cmake_args."
    "Was '${last_item_default}'")
endif()

list(GET __HUNTER_USER_CMAKE_ARGS_Foo -1 last_item_user)
if(NOT last_item_user STREQUAL "TEST=1")
  message(FATAL_ERROR
    "Expected last user CMAKE_ARGS to be the one set by hunter_config."
    "Was '${last_item_user}'")
endif()
