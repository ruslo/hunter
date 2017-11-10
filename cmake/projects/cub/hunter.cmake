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
    cub
    VERSION
    1.7.4-p0
    URL
    "https://github.com/hunter-packages/cub/archive/v1.7.4-p0.tar.gz"
    SHA1
    fa984e46fc50bb9ec56dd0944651a3874c3714ca
    )
  
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cub)
hunter_download(PACKAGE_NAME cub)
