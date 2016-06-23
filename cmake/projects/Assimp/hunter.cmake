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
    Assimp
    VERSION
    3.2-p0
    URL
    "https://github.com/hunter-packages/assimp/archive/v3.2-p0.tar.gz"
    SHA1
    a3f46eb24bc48cacee9f21b1ea4f4a0e3122b847
)

hunter_cmake_args(
    Assimp
    CMAKE_ARGS
    ASSIMP_BUILD_ASSIMP_TOOLS=OFF
    ASSIMP_BUILD_SAMPLES=OFF
    ASSIMP_BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Assimp)
hunter_download(PACKAGE_NAME Assimp)
