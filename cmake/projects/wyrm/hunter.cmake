# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    wyrm
    VERSION
    0.1.0
    URL
    "https://gitlab.obspm.fr/greenflash/wyrm/-/archive/v0.1.0/wyrm-v0.1.0.tar.gz"
    SHA1
    2d2c6b23b3b78f289ff515d76a99bcc8a773213e
)

hunter_cmake_args(
    wyrm
    CMAKE_ARGS
        WYRM_BUILD_EXAMPLES=OFF
        WYRM_BUILD_TESTS=OFF
        WYRM_BUILD_DOCUMENTATION=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(wyrm)
hunter_download(PACKAGE_NAME wyrm)
