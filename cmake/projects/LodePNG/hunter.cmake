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
    "0.0.0-p1"
    URL
    "https://github.com/hunter-packages/lodepng/archive/v0.0.0-p1.tar.gz"
    SHA1
    315129891c5ea6c922ed98398c853a7a83a3c662
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(LodePNG)
hunter_download(PACKAGE_NAME LodePNG)
