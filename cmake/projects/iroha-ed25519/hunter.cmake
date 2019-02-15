# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    iroha-ed25519
    VERSION
    2.0.0
    URL
    "https://github.com/hyperledger/iroha-ed25519/archive/feature/hunter.zip"
    SHA1
    35f683a982da0bf9f291c8ec987dbba7caeafad3
)

# by default, use portable ref10 implementation with default (from ed25519 spec)
# sha2 hashing algororithm, provided by sha2_sphlib implementation
hunter_cmake_args(
    iroha-ed25519
    CMAKE_ARGS
        TESTING=OFF
        EDIMPL=ref10
        HASH=sha2_sphlib
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(iroha-ed25519)
hunter_download(PACKAGE_NAME iroha-ed25519)
