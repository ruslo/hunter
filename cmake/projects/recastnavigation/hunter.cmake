# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    recastnavigation
    VERSION
    1.4-p0
    URL
    "https://github.com/hunter-packages/recastnavigation/archive/v1.4-p0.tar.gz"
    SHA1
    fbbd0387e3e46e4486c8848b9582915eb4cf1084
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(recastnavigation)
hunter_download(PACKAGE_NAME recastnavigation)
