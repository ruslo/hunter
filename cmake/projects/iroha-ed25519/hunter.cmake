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
    "https://github.com/hyperledger/iroha-ed25519/archive/2.0.0.tar.gz"
    SHA1
    fde00802a907081cf1ce6d54158108e81511b285
)

# let iroha-ed25519 automatically select ED and RNG implementations, they
# will depend on OS.
# explicitly set usage of sha2 (as for default in ed25519 spec)
hunter_cmake_args(
    iroha-ed25519
    CMAKE_ARGS
        BUILD=STATIC      # build static library
        TESTING=OFF       # disable tests
        HASH=sha2_sphlib  # use sha2_sphlib impl for hash
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(iroha-ed25519)
hunter_download(PACKAGE_NAME iroha-ed25519)
