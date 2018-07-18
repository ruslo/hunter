# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Microsoft.GSL
    VERSION
    1.0.0
    URL
    "https://github.com/ithron/GSL/archive/v1.0.0-h.tar.gz"
    SHA1
    1a549e0261a10484f8e5a8d9c691c62b5b9aa639
)

hunter_cmake_args(
    Microsoft.GSL
    CMAKE_ARGS
    GSL_TEST=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Microsoft.GSL)
hunter_download(PACKAGE_NAME Microsoft.GSL)
