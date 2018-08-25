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
    5.1.4-p0
    URL
    "https://github.com/hunter-packages/giflib/archive/v5.1.4-p0.tar.gz"
    SHA1
    d93b71a805de3c24316e55164828fe687527a8f4
    )

hunter_add_version(
    PACKAGE_NAME
    giflib
    VERSION
    5.1.4-p1
    URL
    "https://github.com/hunter-packages/giflib/archive/v5.1.4-p1.tar.gz"
    SHA1
    886897af5b36a5d3179e31cf2c1f2d83170eae52
    )
  
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(giflib)
hunter_download(PACKAGE_NAME giflib)
