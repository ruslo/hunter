# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    VulkanMemoryAllocator
    VERSION
    2.0.0-p0
    URL
    "https://github.com/hunter-packages/VulkanMemoryAllocator/archive/v2.0.0-p0.tar.gz"
    SHA1
    f3b38054d2062563cf7cca66bd2e3fc8b9df832d
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(VulkanMemoryAllocator)
hunter_download(PACKAGE_NAME VulkanMemoryAllocator)
