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

hunter_add_version(
    PACKAGE_NAME
    ICU
    VERSION
    55.1-p4
    URL
    "https://github.com/hunter-packages/icu/archive/v55.1-p4.tar.gz"
    SHA1
    4c14de025043ef43b0d8418b87fe6b25a31c6aa7
)

hunter_add_version(
    PACKAGE_NAME
    ICU
    VERSION
    63.1-p1
    URL
    "https://github.com/hunter-packages/icu/archive/v63.1-p1.tar.gz"
    SHA1
    581d4ff13168ecb6eab5cdf559df8cba3d93a778
)

hunter_add_version(
    PACKAGE_NAME
    ICU
    VERSION
    63.1-p2
    URL
    "https://github.com/hunter-packages/icu/archive/v63.1-p2.tar.gz"
    SHA1
    562740c5ab644d8334b20974e73b372625f99c2e
)

hunter_add_version(
    PACKAGE_NAME
    ICU
    VERSION
    63.1-p3
    URL
    "https://github.com/hunter-packages/icu/archive/v63.1-p3.tar.gz"
    SHA1
    6192cef73b0f15c0f4d93a8a3deffeaeb562a65e
)

hunter_add_version(
    PACKAGE_NAME
    ICU
    VERSION
    63.1-p4
    URL
    "https://github.com/hunter-packages/icu/archive/v63.1-p4.tar.gz"
    SHA1
    eead3c1c8f8ec00cb224a50a8895e0333c6c65a8
)

hunter_add_version(
    PACKAGE_NAME
    ICU
    VERSION
    63.1-p5
    URL
    "https://github.com/hunter-packages/icu/archive/v63.1-p5.tar.gz"
    SHA1
    506109ef6fa0c3105be64bcebb5bd9e3fba1a24f
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ICU)
hunter_download(PACKAGE_NAME ICU)
