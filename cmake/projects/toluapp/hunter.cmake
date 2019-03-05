# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    toluapp
    VERSION
    1.0.93-p0
    URL
    "https://github.com/hunter-packages/toluapp/archive/v1.0.93-p0.tar.gz"
    SHA1
    851dabf207286e232c7e9eb1c92c7e62314c0202
)

hunter_add_version(
    PACKAGE_NAME
    toluapp
    VERSION
    1.0.93-p1
    URL
    "https://github.com/hunter-packages/toluapp/archive/v1.0.93-p1.tar.gz"
    SHA1
    39429ce1b90ad12ed34aa366db587514a96c0c9d
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(toluapp)
hunter_download(PACKAGE_NAME toluapp)
