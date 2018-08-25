# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    libunibreak
    VERSION
    4.0
    URL
    "https://github.com/adah1972/libunibreak/releases/download/libunibreak_4_0/libunibreak-4.0.tar.gz"
    SHA1
    44c3294546c56c592d918dcaff14b3b5f96ca627
)

hunter_cmake_args(
    libunibreak
    CMAKE_ARGS
        PKGCONFIG_EXPORT_TARGETS=libunibreak
)

hunter_configuration_types(libunibreak CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_download(PACKAGE_NAME libunibreak)
