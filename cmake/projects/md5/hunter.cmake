# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    md5
    VERSION
    1.6
    URL
    "https://github.com/hunter-packages/md5/archive/v1.6.tar.gz"
    SHA1
    e693ece280ba161001c6024baac3146b2b8778dc
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(md5)
hunter_download(PACKAGE_NAME md5)
