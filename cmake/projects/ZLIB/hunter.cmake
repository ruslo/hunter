# Copyright (c) 2014-2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "1.2.8-p3"
    URL
    "https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz"
    SHA1
    573dc28474be47d0c7abc1475a14aa12f0dfcadc
)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "1.2.8-p2"
    URL
    "https://github.com/hunter-packages/zlib/archive/v1.2.8-p2.tar.gz"
    SHA1
    bef3ee6d68a271dfcd2f659c80d721d4a6b39315
)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "1.2.8-hunter-1"
    URL
    "https://github.com/hunter-packages/zlib/archive/v1.2.8-hunter-1.tar.gz"
    SHA1
    24c89e4b193a56bb411fa9878968002ebe2c6209
)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "1.2.8-hunter"
    URL
    "https://github.com/hunter-packages/zlib/archive/v1.2.8-hunter.tar.gz"
    SHA1
    75a05fcc928ed52e1eeb93f07a1c78a7890860c0
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ZLIB)
hunter_download(PACKAGE_NAME ZLIB)
