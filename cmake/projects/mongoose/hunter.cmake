# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    mongoose
    VERSION
    6.10
    URL
    https://github.com/hunter-packages/mongoose/archive/6.10-p.tar.gz
    SHA1
    7f2af8da196c29a60f597b67cde5706d0acb20a0
)

hunter_add_version(
    PACKAGE_NAME
    mongoose
    VERSION
    5.6
    URL
    https://github.com/hunter-packages/mongoose/archive/5.6-p.tar.gz
    SHA1
    cbb313403e742f09cbbcf1c1a62c13e156c6b803
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mongoose)
hunter_download(PACKAGE_NAME mongoose)
