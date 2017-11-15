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
    "https://github.com/jowr/inja/archive/v0.1-hunter.2.tar.gz"
    SHA1
    f80d15ff43b30ecfa066b2f2ca1e5722a29b0a36
)

hunter_cmake_args(
    inja
    CMAKE_ARGS
        BUILD_UNIT_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(inja)
hunter_download(PACKAGE_NAME inja)
