# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")

project(TestsSimple)

include(hunter_default_version)

set(__HUNTER_ALLOW_DEFAULT_VERSION_LOADING YES)
set(HUNTER_Foo_VERSION "")
hunter_default_version(Foo VERSION 1.2.3)

string(COMPARE EQUAL "${HUNTER_Foo_VERSION}" "1.2.3" is_correct)
if(NOT is_correct)
  message(FATAL_ERROR "Expected HUNTER_Foo_VERSION == 1.2.3")
endif()
