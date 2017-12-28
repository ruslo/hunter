# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    jo_jpeg
    VERSION
    0.0.1
    URL
    "https://github.com/hunter-packages/jo_jpeg/archive/v0.0.1.tar.gz"
    SHA1
    1fdfa0b7f1e0c958f692dea080b8fbee6fca25e9
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(jo_jpeg)
hunter_download(PACKAGE_NAME jo_jpeg)
