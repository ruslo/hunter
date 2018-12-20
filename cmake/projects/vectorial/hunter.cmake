# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    vectorial
    VERSION
    0.0.0-ae7dc88-p0
    URL
    "https://github.com/hunter-packages/vectorial/archive/v0.0.0-ae7dc88-p0.tar.gz"
    SHA1
    e48cfd17f5cfad979b1d0272d3f7012b3ea5dbf2
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(vectorial)
hunter_download(PACKAGE_NAME vectorial)
