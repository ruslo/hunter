# Copyright (c) 2014, Ruslan Baratov
# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-hunter-winsparkle)

add_executable(app_psdk WIN32 app_psdk.c app_psdk.rc)

hunter_add_package(WinSparkle)

find_package(WinSparkle REQUIRED)
target_link_libraries(app_psdk WinSparkle::WinSparkle)
