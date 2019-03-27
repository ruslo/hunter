# Copyright (c) 2019, Pawel Bylica
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Snappy
    VERSION
    1.1.6-p0
    URL
    "https://github.com/google/snappy/archive/77c12adc192ac6620a0f0d340c99149ec56a97a3.tar.gz"
    SHA1
    5f26e7130061e41faa0b7d500a132d8c08a92a48
)

hunter_add_version(
    PACKAGE_NAME
    Snappy
    VERSION
    1.1.7
    URL
    "https://github.com/google/snappy/archive/1.1.7.tar.gz"
    SHA1
    1ec676b842fc96fd8a95b03c12758935e7f257b0
)

hunter_cmake_args(
    Snappy
    CMAKE_ARGS
    SNAPPY_BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Snappy)
hunter_download(PACKAGE_NAME Snappy)
