# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(Foo)

# -- Emulate toolchain
set(ANDROID TRUE)
set(CMAKE_SYSTEM_VERSION 21)
# -- end

hunter_add_package(Sources-for-Android-SDK)
