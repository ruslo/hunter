# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)
project(download-boost)

# Let hunter be more verbose
set(HUNTER_STATUS_DEBUG ON CACHE BOOL "")

# emulate ${HUNTER_SELF}/cmake/Hunter
include("../common.cmake")
include(hunter_add_package)

# download boost
hunter_add_package(Boost)

# now boost can be used
find_package(Boost 1.55 REQUIRED)
message("boost include: ${Boost_INCLUDE_DIRS}")
