# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    aes
    VERSION
    0.0.1-p0
    URL
    "https://github.com/hunter-packages/aes/archive/v0.0.1-p0.tar.gz"
    SHA1
    49ae29df3b0e0619c1db7e7696795c956386f71b
)

hunter_add_version(
    PACKAGE_NAME
    aes
    VERSION
    0.0.1-p1
    URL
    "https://github.com/hunter-packages/aes/archive/v0.0.1-p1.tar.gz"
    SHA1
    5ec961526679246b34332afd1d83c015c377bd79
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(aes)
hunter_download(PACKAGE_NAME aes)
