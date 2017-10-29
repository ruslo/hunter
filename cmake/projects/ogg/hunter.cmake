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
    1.3.2-p1
    URL
    "https://github.com/hunter-packages/ogg/archive/v1.3.2-p1.tar.gz"
    SHA1
    4f3513db3c8a6a616231156225b348deb68ed30e
    )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ogg)
hunter_download(PACKAGE_NAME ogg)
