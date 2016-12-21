# Copyright (c) 2016, Quantitative Engineering Design Inc.
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
    0.0.1-p2
    URL
    "https://github.com/qedsoftware/mini_chromium/archive/v0.0.1-p2.tar.gz"
    SHA1
    1c587622e03e4da8a6bce02a2f6f062eb7f5a26c
)

hunter_add_version(
    PACKAGE_NAME
    mini_chromium
    VERSION
    0.0.1-p1
    URL
    "https://github.com/qedsoftware/mini_chromium/archive/v0.0.1-p1.tar.gz"
    SHA1
    ea942bdcda9d1f32e928ef07a65f4b02e7a6ff6c
)

hunter_add_version(
    PACKAGE_NAME
    mini_chromium
    VERSION
    0.0.1-p0
    URL
    "https://github.com/qedsoftware/mini_chromium/archive/v0.0.1-p0.tar.gz"
    SHA1
    aba3db46ea8a94a1254d4464db2352e60d0e7705
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mini_chromium)
hunter_download(PACKAGE_NAME mini_chromium)
