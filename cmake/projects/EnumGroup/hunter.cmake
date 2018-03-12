# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    EnumGroup
    VERSION
    0.0.1
    URL
    "https://github.com/Person-93/EnumGroup/archive/0.0.1.tar.gz"
    SHA1
    e842e9c81865db3006e1b457b5bedea401ae5734
)

hunter_cmake_args(
    EnumGroup
    CMAKE_ARGS
    ENUM_GROUP_WITH_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(EnumGroup)
hunter_download(PACKAGE_NAME EnumGroup)
