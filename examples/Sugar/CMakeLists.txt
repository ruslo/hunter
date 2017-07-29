# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-sugar)

# download sugar
hunter_add_package(Sugar)

if(NOT EXISTS "${Sugar_LICENSES}")
  message(FATAL_ERROR "File not found: '${Sugar_LICENSES}'")
endif()

message("License: '${Sugar_LICENSES}'")

# now sugar can be used
include("${SUGAR_ROOT}/cmake/Sugar")
include(sugar_status_print)

# try some function
set(SUGAR_STATUS_PRINT ON)
sugar_status_print("Sugar downloaded!")
