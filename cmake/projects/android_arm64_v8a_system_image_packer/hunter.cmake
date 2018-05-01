# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    android_arm64_v8a_system_image_packer
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/android_arm64_v8a_system_image_packer/archive/v1.0.0.tar.gz"
    SHA1
    e11d0b19f4d542c2a1347fb7d813a8efa9031622
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(android_arm64_v8a_system_image_packer)
hunter_download(PACKAGE_NAME android_arm64_v8a_system_image_packer)
