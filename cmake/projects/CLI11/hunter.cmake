# Copyright (c) 2018, Pawel Bylica
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    1.5.3
    URL
    "https://github.com/CLIUtils/CLI11/archive/v1.5.3.tar.gz"
    SHA1
    00c982a7e6819524acda111515ea02308e93a92f
)

hunter_cmake_args(
    CLI11
    CMAKE_ARGS
    CLI11_TESTING=OFF
    CLI11_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(CLI11)
hunter_download(PACKAGE_NAME CLI11)
