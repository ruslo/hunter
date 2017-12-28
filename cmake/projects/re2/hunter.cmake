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
    re2
    VERSION
    2017.11.01-p0
    URL
    https://github.com/hunter-packages/re2/archive/2017.11.01-p0.tar.gz
    SHA1
    78ed8b27fe1499a30281f3763bb282ea47636b1a
    )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(re2)
hunter_download(PACKAGE_NAME re2)
