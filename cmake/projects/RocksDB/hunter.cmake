# Copyright (c) 2017, Pawel Bylica
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    RocksDB
    VERSION
    5.7.2-p0
    URL
    "https://github.com/facebook/rocksdb/archive/c41744270ac0e5ee649181211d8b09facfa45255.tar.gz"
    SHA1
    74882dfe216445be9e7c96116c3be831bb9acdab
)

hunter_cmake_args(
    RocksDB
    CMAKE_ARGS
    ROCKSDB_LITE=ON
    WITH_TESTS=OFF
    FAIL_ON_WARNINGS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(RocksDB)
hunter_download(PACKAGE_NAME RocksDB)
