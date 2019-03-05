# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    stanhull
    VERSION
    0.0.1
    URL
    "https://github.com/hunter-packages/stanhull/archive/v0.0.1.tar.gz"
    SHA1
    df0a99f598ba46f7dfa9e017bc043d62828ebc55
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(stanhull)
hunter_download(PACKAGE_NAME stanhull)
