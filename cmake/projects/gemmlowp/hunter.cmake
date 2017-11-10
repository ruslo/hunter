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
    gemmlowp
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/gemmlowp/archive/v1.0.0.tar.gz"
    SHA1
    2da3f6f97b9e3368a3afd5d002334248b79cf6c3
    )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(gemmlowp)
hunter_download(PACKAGE_NAME gemmlowp)
