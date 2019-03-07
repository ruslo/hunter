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

hunter_add_version(
    PACKAGE_NAME
    v8
    VERSION
    7.4.98-p2
    URL
    "https://github.com/hunter-packages/v8/archive/v7.4.98-p2.tar.gz"
    SHA1
    7b165ee53bf804ce543880e21954b6d000053571
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(v8)
hunter_download(PACKAGE_NAME v8)
