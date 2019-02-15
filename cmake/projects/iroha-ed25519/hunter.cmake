# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    iroha-ed25519
    VERSION
    2.0.0
    URL
    "https://github.com/hyperledger/iroha-ed25519/archive/2.0.0.tar.gz"
    SHA1
    1111111111111111111111111111111111111111
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(iroha-ed25519)
hunter_download(PACKAGE_NAME iroha-ed25519)
