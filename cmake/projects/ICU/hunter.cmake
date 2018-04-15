# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ICU
    VERSION
    55.1-p1
    URL
    "https://github.com/hunter-packages/icu/archive/v55.1-p1.tar.gz"
    SHA1
    605defbeb77697dc59edff6bcfcd37ce89e43457
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ICU)
hunter_download(PACKAGE_NAME ICU)
