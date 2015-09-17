# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(Foo)

# -- Emulate toolchain
set(ANDROID TRUE)
set(ANDROID_NATIVE_API_LEVEL 21)
# -- end

hunter_add_package(Android-SDK-Platform)
