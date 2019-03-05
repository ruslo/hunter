# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    icu-lx
    VERSION
    63.1-p0
    URL
    "https://github.com/hunter-packages/icu-lx/archive/v63.1-p0.tar.gz"
    SHA1
    264075debfe574ff5dc963b04375b262b6f8199f
)

hunter_add_version(
    PACKAGE_NAME
    icu-lx
    VERSION
    63.1-p1
    URL
    "https://github.com/hunter-packages/icu-lx/archive/v63.1-p1.tar.gz"
    SHA1
    cabcef58770922c9b0695663445f57c3f66750dd
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(icu-lx)
hunter_download(PACKAGE_NAME icu-lx)
