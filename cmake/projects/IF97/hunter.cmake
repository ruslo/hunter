# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    IF97
    VERSION
    2.1.2
    URL
    "https://github.com/CoolProp/IF97/archive/v2.1.2.tar.gz"
    SHA1
    84d7a541d7aee33c708b25499c82e12cf68f63f1
)

hunter_cmake_args(
    IF97
    CMAKE_ARGS
        IF97_CMAKE_MODULE=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(IF97)
hunter_download(PACKAGE_NAME IF97)
