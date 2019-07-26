# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    quickjs
    VERSION
    2019-07-21-p0
    URL
    "https://github.com/hunter-packages/quickjs/archive/2019-07-21-p0.tar.gz"
    SHA1
    def3915206ca673831601adf4efbe0f8264806e5
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(quickjs)
hunter_download(PACKAGE_NAME quickjs)
