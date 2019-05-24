# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    zip
    VERSION
    0.1.15
    URL
    "https://github.com/kuba--/zip/archive/v0.1.15.tar.gz"
    SHA1
    f65b4fde71963de6c019413628022d316098c8d1
)

hunter_cmake_args(
    zip
    CMAKE_ARGS
        CMAKE_DISABLE_TESTING=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(zip)
hunter_download(PACKAGE_NAME zip)
