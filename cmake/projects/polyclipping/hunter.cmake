# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    polyclipping
    VERSION
    "6.2.1-p0"
    URL
    "https://github.com/hunter-packages/polyclipping/archive/v6.2.1-p0.tar.gz"
    SHA1
    e9b7ee2a297d19c15033462544b1e5d1ce82d4b7
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(polyclipping)
hunter_download(PACKAGE_NAME polyclipping)
