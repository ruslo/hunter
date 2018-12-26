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
    0.0.0-12ecff3-p2
    URL
    "https://github.com/t0p4/breakpad/archive/v0.0.0-12ecff3-p2.tar.gz"
    SHA1
    1aa21df5c3c11b672e54363ba053ab3dce2dd049
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(breakpad)
hunter_download(PACKAGE_NAME breakpad)
