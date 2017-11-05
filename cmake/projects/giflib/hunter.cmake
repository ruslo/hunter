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
    giflib
    VERSION
    5.1.4
    URL
    "https://github.com/hunter-packages/giflib/archive/v5.1.4.tar.gz"
    SHA1
    45f4b0f615b8cc5034a3adcf46f315caccb32988
    )
  
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(giflib)
hunter_download(PACKAGE_NAME giflib)
