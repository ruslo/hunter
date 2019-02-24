# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    v8
    VERSION
    7.4.98-p1
    URL
    "https://github.com/hunter-packages/v8/archive/v7.4.98-p1.tar.gz"
    SHA1
    44805a2abbfc65fa73dbbfaa0383135dae9d05af
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(v8)
hunter_download(PACKAGE_NAME v8)
