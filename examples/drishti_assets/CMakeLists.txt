# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-drishti_assets)

hunter_add_package(drishti_assets)
find_package(drishti_assets CONFIG REQUIRED)

if(NOT EXISTS "${DRISHTI_ASSETS_FACTORY}")
  message(FATAL_ERROR "File not found: '${DRISHTI_ASSETS_FACTORY}'")
endif()
