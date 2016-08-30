# Copyright (c) 2016, Quantitative Engineering Design Inc.
# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    crashpad
    VERSION
    v0.0.1-p0
    URL
    "https://github.com/qedsoftware/crashpad/archive/v0.0.1-p0.tar.gz"
    SHA1
    da077be232736b0922ab8f06610ad9dd9d206936
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cmake_args(crashpad CMAKE_ARGS CRASHPAD_BUILD_TESTS=OFF)
hunter_cacheable(crashpad)
hunter_download(PACKAGE_NAME crashpad)
