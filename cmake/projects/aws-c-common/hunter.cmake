# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    aws-c-common
    VERSION
    0.2.1
    URL
    "https://github.com/hunter-packages/aws-c-common/archive/hunter-0.2.1.tar.gz"
    SHA1
    611ebf1e10eb0f798af00a9330adb5503c7f9c16
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(aws-c-common)
hunter_download(PACKAGE_NAME aws-c-common)
