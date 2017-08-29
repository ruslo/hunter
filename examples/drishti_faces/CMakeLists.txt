# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-drishti_faces)

hunter_add_package(drishti_faces)
find_package(drishti_faces CONFIG REQUIRED)

if(NOT EXISTS "${DRISHTI_FACES_EYE_IMAGE}")
  message(FATAL_ERROR "File not found: '${DRISHTI_FACES_EYE_IMAGE}'")
endif()
