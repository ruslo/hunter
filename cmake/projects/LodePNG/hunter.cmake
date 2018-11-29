# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    LodePNG
    VERSION
    "0.0.0-p0"
    URL
    "https://github.com/hunter-packages/lodepng/archive/v0.0.0-p0.tar.gz"
    SHA1
    262cd3528f73e917c560ff7d9c0bdd9b4f1cc761
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(LodePNG)
hunter_download(PACKAGE_NAME LodePNG)
