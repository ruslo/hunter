# Copyright (c) 2015, Ruslan Baratov, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    half
    VERSION
    "1.1.0-p1"
    URL
    "https://github.com/hunter-packages/half/archive/v1.1.0-p1.tar.gz"
    SHA1
    bc445fc2b91c7a2c4ea0025012068ecab18ef36d
)

hunter_add_version(
    PACKAGE_NAME
    half
    VERSION
    "1.1.0-p0"
    URL
    "https://github.com/headupinclouds/half/archive/v1.1.0-p0.tar.gz"
    SHA1
    ad46279b4baf5e819881e66303bb20f88d6df916
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(half)
hunter_download(PACKAGE_NAME half)
