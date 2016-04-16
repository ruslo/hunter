# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ios_sim
    VERSION
    "3.1.1"
    URL
    "https://github.com/phonegap/ios-sim/archive/3.1.1.tar.gz"
    SHA1
    fbed1bf01253d99ab643e6cdf9fa4e999111324c
)

hunter_add_version(
    PACKAGE_NAME
    ios_sim
    VERSION
    "1.8.2"
    URL
    "https://github.com/phonegap/ios-sim/archive/1.8.2.tar.gz"
    SHA1
    4328b3c8e6b455631d52b7ce5968170c9769eb1e
)

hunter_pick_scheme(DEFAULT url_sha1_ios_sim)
hunter_download(PACKAGE_NAME ios_sim)
