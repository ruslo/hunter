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
    1.0.0-p0
    URL
    "https://github.com/hunter-packages/Microsoft.GSL/archive/v1.0.0-p0.tar.gz"
    SHA1
    3cc3b9f2f7e5cde7827b8793ab6b4a8717511c9a
)

hunter_add_version(
    PACKAGE_NAME
    Microsoft.GSL
    VERSION
    1.0.0-p1
    URL
    "https://github.com/hunter-packages/Microsoft.GSL/archive/v1.0.0-p1.tar.gz"
    SHA1
    d38a9e318a1ad1d96d169cd91f0909f1dc85e0d7
)

hunter_cmake_args(
    Microsoft.GSL
    CMAKE_ARGS
    GSL_TEST=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Microsoft.GSL)
hunter_download(PACKAGE_NAME Microsoft.GSL)
