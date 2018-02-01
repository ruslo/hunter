# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Box2D
    VERSION
    2.3.1-p0
    URL
    "https://github.com/hunter-packages/Box2D/archive/v2.3.1-p0.tar.gz"
    SHA1
    5e34dad2674c65d5c79d2a23abcd881da1af90b9
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Box2D)
hunter_download(PACKAGE_NAME Box2D)
