# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    mini_chromium
    VERSION
    0.0.1-p0
    URL
    "https://github.com/hunter-packages/mini_chromium/archive/v0.0.1-p0.tar.gz"
    SHA1
    aba3db46ea8a94a1254d4464db2352e60d0e7705
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mini_chromium)
hunter_download(PACKAGE_NAME mini_chromium)
