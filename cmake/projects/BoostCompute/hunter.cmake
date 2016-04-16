# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    BoostCompute
    VERSION
    0.5-p0
    URL
    "https://github.com/hunter-packages/boost-compute/archive/v0.5-p0.tar.gz"
    SHA1
    f9a54b5210a4a8f1beb8c7bd3e2469a76f975de5
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(BoostCompute)
hunter_download(PACKAGE_NAME BoostCompute)
