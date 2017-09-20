# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-gst_plugins_good)

hunter_add_package(gst_plugins_good)

add_executable(foo foo.cpp)
