# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    duktape
    VERSION
    1.5.2-p0
    URL
    "https://github.com/hunter-packages/duktape/archive/v1.5.2-p0.tar.gz"
    SHA1
    d5e271aecae4fd6da5d3526783f4278e83c2853a
)

hunter_add_version(
    PACKAGE_NAME
    duktape
    VERSION
    2.2.1-p0
    URL
    "https://github.com/hunter-packages/duktape/archive/v2.2.1-p0.tar.gz"
    SHA1
    7482a0870d9dd1908384fdc465e1f31fc0ae04ca
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(duktape)
hunter_download(PACKAGE_NAME duktape)
