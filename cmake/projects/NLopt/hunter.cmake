# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    NLopt
    VERSION
    2.5.0
    URL
    "https://github.com/t0p4/nlopt/archive/v2.5.0-p11.tar.gz"
    SHA1
    31e99944214d49fc1ebf94980085ad2fc1708e13
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(NLopt)
hunter_download(PACKAGE_NAME NLopt)
