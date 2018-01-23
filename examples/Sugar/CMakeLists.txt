# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-sugar)

hunter_add_package(Sugar)
find_package(sugar CONFIG REQUIRED)

include(sugar_status_print)

option(SUGAR_STATUS_PRINT "Print info" ON)
sugar_status_print("Sugar downloaded!")

if(NOT EXISTS "${Sugar_LICENSES}")
  message(FATAL_ERROR "File not found: '${Sugar_LICENSES}'")
endif()

message("License: '${Sugar_LICENSES}'")
