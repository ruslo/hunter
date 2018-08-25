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

hunter_add_version(
    PACKAGE_NAME
    ICU
    VERSION
    55.1-p2
    URL
    "https://github.com/hunter-packages/icu/archive/v55.1-p2.tar.gz"
    SHA1
    fe7aef7858fbd3bcc951ebb1e427d20d03c7cbde
)

hunter_add_version(
    PACKAGE_NAME
    ICU
    VERSION
    55.1-p3
    URL
    "https://github.com/hunter-packages/icu/archive/v55.1-p3.tar.gz"
    SHA1
    0e9f4d37b1601a0a2947fe3abb7d6945df9e5ea4
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ICU)
hunter_download(PACKAGE_NAME ICU)
