# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-QtCMakeExtra)

# download sugar
hunter_add_package(QtCMakeExtra)

if(NOT EXISTS "${QTCMAKEEXTRA_ROOT}/cmake/QtCMakeExtraHelpers.cmake")
  message(FATAL_ERROR "Module not found")
endif()
