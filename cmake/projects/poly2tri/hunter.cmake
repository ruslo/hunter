# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    poly2tri
    VERSION
    "1.0.0"
    URL
    "https://github.com/hunter-packages/poly2tri/archive/v1.0.0.tar.gz"
    SHA1
    6ac163c6eedc5f4d533c6e2cf8ea209a72f7a643
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(poly2tri)
hunter_download(PACKAGE_NAME poly2tri)
