# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-sugar)

# DOCUMENTATION_START {
hunter_add_package(sugar)
find_package(sugar CONFIG REQUIRED)

sugar_include(boo)
# DOCUMENTATION_END }

message("BOO_SOURCES: ${BOO_SOURCES}")

include(sugar_status_print)

option(SUGAR_STATUS_PRINT "Print info" ON)
sugar_status_print("sugar downloaded!")

if(NOT EXISTS "${sugar_LICENSES}")
  message(FATAL_ERROR "File not found: '${sugar_LICENSES}'")
endif()

message("License: '${sugar_LICENSES}'")
