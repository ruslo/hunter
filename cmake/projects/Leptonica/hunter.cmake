# Copyright (c) 2017, Sacha Refshauge
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Leptonica
    VERSION
    "1.74.2-p3"
    URL
    "https://github.com/hunter-packages/leptonica/archive/v1.74.2-p3.tar.gz"
    SHA1
    ce7e50033e807c1145c858390315ad32844ce16b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Leptonica)
hunter_download(PACKAGE_NAME Leptonica)
