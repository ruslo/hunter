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
    jemalloc
    VERSION
    4.2.0-p0
    URL
    "https://github.com/hunter-packages/jemalloc/archive/v4.2.0-p0.tar.gz"
    SHA1
    f135750c7b0b64bfd364eff33dd39c7849ac9edd
    )
  
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(jemalloc)
hunter_download(PACKAGE_NAME jemalloc)
