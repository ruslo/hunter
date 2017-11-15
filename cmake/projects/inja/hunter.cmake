# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    inja
    VERSION
    0.1
    URL
    "https://github.com/jowr/inja/archive/v0.1-hunter.4.tar.gz"
    SHA1
    a8af3f807bbcf25a33be605eacf4e72bb8cdf47e
)

hunter_cmake_args(
    inja
    CMAKE_ARGS
        BUILD_UNIT_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(inja)
hunter_download(PACKAGE_NAME inja)
