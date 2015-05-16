# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ippicv)

# download ippicv
hunter_add_package(ippicv)

file(GLOB ippicv_archive "${IPPICV_ROOT}/ippicv_*")
if(EXISTS "${ippicv_archive}")
  message("ippicv archive: ${ippicv_archive}")
else()
  message(FATAL_ERROR "Nothing found in `${IPPICV_ROOT}`")
endif()
