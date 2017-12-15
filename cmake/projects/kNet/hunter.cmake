# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    kNet
    VERSION
    2.7-p1
    URL
    "https://github.com/hunter-packages/kNet/archive/v2.7-p1.tar.gz"
    SHA1
    3a7bc8c9f9f14ffbfac4ce5328fa6735544b51c8
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(kNet)
hunter_download(PACKAGE_NAME kNet)
