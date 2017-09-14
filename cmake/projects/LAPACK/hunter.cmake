# Copyright (c) 2017, NeroBurner
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

if(NOT MSVC)
  include("${CMAKE_CURRENT_LIST_DIR}/hunter-source.cmake")
else()
  include("${CMAKE_CURRENT_LIST_DIR}/hunter-msvc.cmake")
endif()

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME LAPACK)
