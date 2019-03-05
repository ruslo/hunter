# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    icu-le-hb
    VERSION
    1.0.3-231788a-p0
    URL
    "https://github.com/hunter-packages/icu-le-hb/archive/v1.0.3-231788a-p0.tar.gz"
    SHA1
    0ce9cabd279e690773c044063d75f9c5d6e229bb
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(icu-le-hb)
hunter_download(PACKAGE_NAME icu-le-hb)
