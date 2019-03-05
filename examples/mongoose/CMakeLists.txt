# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-mongoose)

hunter_add_package(mongoose)
find_package(mongoose CONFIG REQUIRED)

add_executable(mongoose simplest_web_server.c)
target_link_libraries(mongoose mongoose::mongoose)
