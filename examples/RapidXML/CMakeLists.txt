
# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("${CMAKE_CURRENT_SOURCE_DIR}/../common.cmake")

project(download-RapidXML)

# download RapidXML
hunter_add_package(RapidXML)

# RapidXML available
find_package(RapidXML REQUIRED CONFIG)

add_executable(foo foo.cpp)
target_link_libraries(foo RapidXML::RapidXML)
