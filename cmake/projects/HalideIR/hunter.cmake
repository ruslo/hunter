# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    HalideIR
    VERSION
    0.0-2f3ecdf-p0
    URL
    "https://github.com/hunter-packages/HalideIR/archive/v0.0-2f3ecdf-p0.tar.gz"
    SHA1
    1f1dfb75eb296ad874aac67cf5b604ddfbe944a1
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(HalideIR)
hunter_download(PACKAGE_NAME HalideIR)
