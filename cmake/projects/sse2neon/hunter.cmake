# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    sse2neon
    VERSION
    1.0.0-p0
    URL
    "https://github.com/hunter-packages/sse2neon/archive/v1.0.0-p0.tar.gz"
    SHA1
    1a3104782526ea6aba9e5429dc64414e91b4cf1c
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(sse2neon)
hunter_download(PACKAGE_NAME sse2neon)
