# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libjpeg-turbo
    VERSION
    2.0.3-p0
    URL
    "https://github.com/hunter-packages/libjpeg-turbo/archive/v2.0.3-p0.tar.gz"
    SHA1
    7b1a439887a71a72da087cce71396fadd81008a2
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libjpeg-turbo)
hunter_download(PACKAGE_NAME libjpeg-turbo)
