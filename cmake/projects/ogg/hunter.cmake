# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ogg
    VERSION
    1.3.2-p2
    URL
    "https://github.com/hunter-packages/ogg/archive/v1.3.2-p2.tar.gz"
    SHA1
    40f04fb995d33fa3d24b0bf3c305b7f2e9a6a33c
    )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ogg)
hunter_download(PACKAGE_NAME ogg)
