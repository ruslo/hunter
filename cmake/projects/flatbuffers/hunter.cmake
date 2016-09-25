# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    flatbuffers
    VERSION
    1.4.0-p1
    URL
    "https://github.com/hunter-packages/flatbuffers/archive/v1.4.0-p1.tar.gz"
    SHA1
    dd97013e6aa60c2626b33091d4523fb6402bf922
)

hunter_cmake_args(
    flatbuffers
    CMAKE_ARGS
        FLATBUFFERS_BUILD_FLATC=ON
        FLATBUFFERS_BUILD_FLATHASH=OFF
        FLATBUFFERS_BUILD_FLATLIB=ON
        FLATBUFFERS_BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(flatbuffers)
hunter_download(PACKAGE_NAME flatbuffers)
