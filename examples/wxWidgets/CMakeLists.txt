# Copyright (c) 2014, Ruslan Baratov
# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-hunter-wxwidgets)

if(WIN32)
  set(MAIN_TYPE WIN32)
else()
  set(MAIN_TYPE)
endif()

add_executable(minimal ${MAIN_TYPE} minimal.cpp sample.rc)

hunter_add_package(wxWidgets)

find_package(wxWidgets REQUIRED core base)
include(${wxWidgets_USE_FILE})
target_link_libraries(minimal ${wxWidgets_LIBRARIES})
