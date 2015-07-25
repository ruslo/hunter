# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(Foo)

hunter_add_package(QtAndroidCMake)

list(APPEND CMAKE_MODULE_PATH "${QTANDROIDCMAKE_ROOT}")

include(AddQtAndroidApk)
