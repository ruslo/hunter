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
    0.0.0-12ecff3-p1
    URL
    "https://github.com/hunter-packages/breakpad/archive/v0.0.0-12ecff3-p1.tar.gz"
    SHA1
    6d6ba5d3f0b8d317b61d1a4256dcdd55f29d19ee
)

hunter_add_version(
    PACKAGE_NAME
    breakpad
    VERSION
    0.0.0-12ecff3-p2
    URL
    "https://github.com/hunter-packages/breakpad/archive/v0.0.0-12ecff3-p2.tar.gz"
    SHA1
    583524ee8f08d0b036bfb4ad3566144b4c272965
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(breakpad)
hunter_download(PACKAGE_NAME breakpad)
