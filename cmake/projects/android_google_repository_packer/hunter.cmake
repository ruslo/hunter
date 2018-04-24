# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    android_google_repository_packer
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/android_google_repository_packer/archive/v1.0.0.tar.gz"
    SHA1
    0ed84e8bae92cc4f4d0a5eabd880299cd660624a
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(android_google_repository_packer)
hunter_download(PACKAGE_NAME android_google_repository_packer)
