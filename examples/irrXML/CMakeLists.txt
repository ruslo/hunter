# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-irrXML)

# download irrXML
hunter_add_package(irrXML)

# now irrXML can be used
find_package(irrXML CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo irrXML::irrXML)
