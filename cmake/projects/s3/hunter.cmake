# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    s3
    VERSION
    0.0.0-287e4be-p0
    URL
    "https://github.com/hunter-packages/libs3/archive/v0.0.0-287e4be-p0.tar.gz"
    SHA1
    da8fae10bcda3126b0847b2a255e62435afc313e
)

hunter_add_version(
    PACKAGE_NAME
    s3
    VERSION
    0.0.0-287e4be-p1
    URL
    "https://github.com/hunter-packages/libs3/archive/v0.0.0-287e4be-p1.tar.gz"
    SHA1
    908d859fcde3424ee5e3226288d2604c2419d996
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(s3)
hunter_download(PACKAGE_NAME s3)
