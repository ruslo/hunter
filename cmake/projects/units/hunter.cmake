# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    units
    VERSION
    3.0.0.alpha-2
    URL
    "https://github.com/nholthaus/units/archive/v3.0.0.alpha-2.tar.gz"
    SHA1
    7e0835b63683836249d533820f59c6c6b36a3230
)

hunter_cmake_args(
    units
    CMAKE_ARGS
        BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(units)
hunter_download(PACKAGE_NAME units)
