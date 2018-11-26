# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    breakpad
    VERSION
    1.0-p0
    URL
    "https://github.com/t0p4/breakpad/archive/v1.0-p0.tar.gz"
    SHA1
    409820f2d111add1220a034e668d74de23ff182b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(breakpad)
hunter_download(PACKAGE_NAME breakpad)
