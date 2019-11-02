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
    chromium_zlib
    VERSION
    0.0.0-f87c2b10efb4-p0
    URL
    "https://github.com/hunter-packages/chromium_zlib/archive/v0.0.0-f87c2b10efb4-p0.tar.gz"
    SHA1
    2fc1f19ef5ba48c415a614e56e1c12507f4676ab
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(chromium_zlib)
hunter_download(PACKAGE_NAME chromium_zlib)
