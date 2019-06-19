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

hunter_add_version(
    PACKAGE_NAME
    HalideIR
    VERSION
    0.0-b257a92-p1
    URL
    "https://github.com/hunter-packages/HalideIR/archive/v0.0-b257a92-p1.tar.gz"
    SHA1
    3b527b4e9d07e194f2143ce14563f69dc6a4db93
)

hunter_add_version(
    PACKAGE_NAME
    HalideIR
    VERSION
    0.0-32057b5-p0
    URL
    "https://github.com/hunter-packages/HalideIR/archive/v0.0-32057b5-p0.tar.gz"
    SHA1
    f1becfb86a2e59e40094a74b200f5d2e374676de
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(HalideIR)
hunter_download(PACKAGE_NAME HalideIR)
