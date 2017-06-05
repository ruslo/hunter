# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    nanoflann
    VERSION
    1.2.3-p0
    URL
    "https://github.com/hunter-packages/nanoflann/archive/v1.2.3-p0.tar.gz"
    SHA1
    72a42a31056aab380eac09b9f00dab18e91235b8
    )

hunter_cmake_args(
  nanoflann
  CMAKE_ARGS
  NANOFLANN_BUILD_EXAMPLES=OFF
  NANOFLANN_BUILD_TESTS=OFF
  )  

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(nanoflann)
hunter_download(PACKAGE_NAME nanoflann)
