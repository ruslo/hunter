# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    folly
    VERSION
    2017.11.13.00-p0
    URL
    "https://github.com/hunter-packages/folly/archive/v2017.11.13.00-p0.tar.gz"
    SHA1
    cb7592adcda706df5f558466b96b1ab4c6bc751a
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(folly)
hunter_download(PACKAGE_NAME folly)
