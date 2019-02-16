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
    harfbuzz
    VERSION
    1.7.6-p0
    URL
    "https://github.com/hunter-packages/harfbuzz/archive/v1.7.6-p0.tar.gz"
    SHA1
    11102ba60b34a12e1fd31b3bbd18e0a61f5f6ba1
)

hunter_add_version(
    PACKAGE_NAME
    harfbuzz
    VERSION
    1.7.6-p1
    URL
    "https://github.com/hunter-packages/harfbuzz/archive/v1.7.6-p1.tar.gz"
    SHA1
    adec471f56a305970a071f7ab10803012660cf79
)

hunter_cmake_args(
    harfbuzz
    CMAKE_ARGS
        HB_HAVE_FREETYPE=ON
        HB_HAVE_ICU=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(harfbuzz)
hunter_download(PACKAGE_NAME harfbuzz)
