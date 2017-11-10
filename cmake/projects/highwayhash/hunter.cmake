# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    highwayhash
    VERSION
    0.0.0
    URL
    "https://github.com/hunter-packages/highwayhash/archive/v0.0.0.tar.gz"
    SHA1
    d62b32d5c8b6e63f6d4f8e72cfb495572b4f5386
 )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(highwayhash)
hunter_download(PACKAGE_NAME highwayhash)
