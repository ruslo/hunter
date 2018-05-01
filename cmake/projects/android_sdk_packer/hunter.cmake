# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    android_sdk_packer
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/android_sdk_packer/archive/v1.0.0.tar.gz"
    SHA1
    9b32b707535d59f036d2600a1d876a0ca28a472e
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(android_sdk_packer)
hunter_download(PACKAGE_NAME android_sdk_packer)
