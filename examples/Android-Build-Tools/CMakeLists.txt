# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(Foo)

hunter_add_package(Android-Build-Tools)

if(NOT EXISTS "${ANDROID_BUILD_TOOLS_ROOT}")
  message(FATAL_ERROR "ANDROID_BUILD_TOOLS_ROOT")
endif()

if(NOT EXISTS "${ANDROID-BUILD-TOOLS_ROOT}")
  message(FATAL_ERROR "ANDROID-BUILD-TOOLS_ROOT")
endif()
