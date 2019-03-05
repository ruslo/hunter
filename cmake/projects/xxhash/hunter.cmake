# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    xxhash
    VERSION
    0.6.5-p0
    URL
    "https://github.com/hunter-packages/xxHash/archive/0.6.5-p0.tar.gz"
    SHA1
    7d84575a45360d5c5c075ceb3fc1eb6b334aa5a4
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(xxhash)
hunter_download(PACKAGE_NAME xxhash)
