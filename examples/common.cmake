# Copyright (c) 2013, 2015 Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

if(NOT HUNTER_ROOT)
  message(FATAL_ERROR "Expected HUNTER_ROOT")
endif()

# Emulate HunterGate
set(HUNTER_GATE_ROOT "${HUNTER_ROOT}")
set(_unused "xxxxxxx")
set(HUNTER_GATE_VERSION "${_unused}")
set(HUNTER_GATE_SHA1 "${_unused}")
# -- end

include("${HUNTER_ROOT}/cmake/Hunter")
include(hunter_add_package)
