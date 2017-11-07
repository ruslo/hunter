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
    re2
    VERSION
    2017.11.01
    URL
    https://github.com/headupinclouds/re2/archive/2017.11.01.tar.gz
    SHA1
    17316240e8e28dd32be6e7271fe504a35d2dff76
    )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(re2)
hunter_download(PACKAGE_NAME re2)
