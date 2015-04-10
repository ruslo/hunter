# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

# download boost
hunter_add_package(Boost)

# now boost can be used
find_package(Boost 1.55 REQUIRED)
message("Boost include: ${Boost_INCLUDE_DIRS}")
