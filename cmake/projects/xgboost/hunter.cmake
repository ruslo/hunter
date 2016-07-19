# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.40-p2
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.40-p2.tar.gz"
    SHA1
    dc1e21d0b023df87915c0140999286afed064c50
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(xgboost)
hunter_download(PACKAGE_NAME xgboost)
