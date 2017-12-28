# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    lz4
    VERSION
    1.8.0-p1
    URL
    "https://github.com/hunter-packages/lz4/archive/v1.8.0-p1.tar.gz"
    SHA1
    00b58d5f28404ed1fdd3410468ebaa44c2ad8a16
)

hunter_add_version(
    PACKAGE_NAME
    lz4
    VERSION
    1.8.0-p2
    URL
    "https://github.com/hunter-packages/lz4/archive/v1.8.0-p2.tar.gz"
    SHA1
    e96abaedd5d8a5a61c21316c8bb173b1954c7c6b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(lz4)
hunter_download(PACKAGE_NAME lz4)
