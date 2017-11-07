# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    lmdb
    VERSION
    0.9.21
    URL
    "https://github.com/headupinclouds/lmdb/archive/v0.9.21.tar.gz"
    SHA1
    cfe06cccccf45f18bfe5d5df6f72a62ccd1279ca
    )
  
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(lmdb)
hunter_download(PACKAGE_NAME lmdb)
