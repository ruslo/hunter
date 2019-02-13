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
    v0.6.5-p0
    URL
    "https://github.com/Warchant/xxHash/archive/v0.6.5-p0.tar.gz"
    SHA1
    bf52e03fbec39143011fd9d1673dd9c32872c574
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(xxhash)
hunter_download(PACKAGE_NAME xxhash)
