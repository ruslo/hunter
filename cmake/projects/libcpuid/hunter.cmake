# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libcpuid
    VERSION
    0.4.0
    URL
    "https://github.com/hunter-packages/libcpuid/archive/v0.4.0-p0.tar.gz"
    SHA1
    dd8255b9a6e84f0d4c81f26b4a32c9af9b2a4e03
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libcpuid)
hunter_download(PACKAGE_NAME libcpuid)
