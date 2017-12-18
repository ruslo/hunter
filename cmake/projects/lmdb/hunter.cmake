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
    0.9.21-p1
    URL
    "https://github.com/hunter-packages/lmdb/archive/v0.9.21-p1.tar.gz"
    SHA1
    4218e126cbc18756d93a798f56e5e6dd10803aae
  )

hunter_add_version(
    PACKAGE_NAME
    lmdb
    VERSION
    0.9.21-p2
    URL "https://github.com/hunter-packages/lmdb/archive/v0.9.21-p2.tar.gz"
    SHA1 "ae88e15f646d26ca0a4a4b0d05041460bd509736"
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(lmdb)
hunter_download(PACKAGE_NAME lmdb)
