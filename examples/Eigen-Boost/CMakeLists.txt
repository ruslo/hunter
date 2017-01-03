# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(HUNTER_USE_CACHE_SERVERS NO)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-eigen)

# Build Boost first.
hunter_add_package(Boost)

# Then try to build Eigen.
# Eigen calls 'find_package(Boost)' but doesn't call 'hunter_add_package(Boost)',
# this leads to conflict similar to the one described in:
# * https://docs.hunter.sh/en/latest/creating-new/cmake-dependencies.html#conflict
# Fix: exclude code with 'find_package(Boost)' (this code only for building tests)
# or hunterize Eigen.
hunter_add_package(Eigen)
