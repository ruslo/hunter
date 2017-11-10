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
    farmhash
    VERSION
    1.1
    URL
    https://github.com/hunter-packages/farmhash/archive/v1.1.tar.gz
    SHA1
    d2f911dc4fa72af2a6ff82c2ca372c7b0f05493d
    )
  
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(farmhash)
hunter_download(PACKAGE_NAME farmhash)
