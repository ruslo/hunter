# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Clang
    VERSION
    "4.0.1-p0"
    URL
    "https://github.com/hunter-packages/clang/archive/v4.0.1-p0.tar.gz"
    SHA1
    cc2e74c852f57c946a4337812c73ce1bc97d639f
)

hunter_add_version(
    PACKAGE_NAME
    Clang
    VERSION
    "3.6.2-p0"
    URL
    "https://github.com/hunter-packages/clang/archive/v3.6.2-p0.tar.gz"
    SHA1
    a83fb5364829f3836cbf0104cb54500359d4ea8c
)

hunter_add_version(
    PACKAGE_NAME
    Clang
    VERSION
    "3.6.2"
    URL
    "http://llvm.org/releases/3.6.2/cfe-3.6.2.src.tar.xz"
    SHA1
    7ba809c9c17819a16b668640a642ed134d7052f0
)

hunter_add_version(
    PACKAGE_NAME
    Clang
    VERSION
    "3.6.0"
    URL
    "http://llvm.org/releases/3.6.0/cfe-3.6.0.src.tar.xz"
    SHA1
    06b252867a3d118c95ca279fd3c4ac05f6730551
)

hunter_add_version(
    PACKAGE_NAME
    Clang
    VERSION
    "3.5.0"
    URL
    "http://llvm.org/releases/3.5.0/cfe-3.5.0.src.tar.xz"
    SHA1
    834cee2ed8dc6638a486d8d886b6dce3db675ffa
)

hunter_add_version(
    PACKAGE_NAME
    Clang
    VERSION
    "3.4.2"
    URL
    "http://llvm.org/releases/3.4.2/cfe-3.4.2.src.tar.gz"
    SHA1
    add5420b10c3c3a38c4dc2322f8b64ba0a5def97
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)

hunter_download(PACKAGE_NAME Clang)
