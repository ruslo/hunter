# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    lzma
    VERSION
    5.2.3-p0
    URL
    "https://github.com/hunter-packages/lzma/archive/v5.2.3-p0.tar.gz"
    SHA1
    98de5eb2f3bf361a836ee78509f311db1c54494b
)

hunter_add_version(
    PACKAGE_NAME
    lzma
    VERSION
    5.2.3-p1
    URL
    "https://github.com/hunter-packages/lzma/archive/v5.2.3-p1.tar.gz"
    SHA1
    391ace8ca1ae84d3b4fb9750943749bc6b589e87
)

hunter_add_version(
    PACKAGE_NAME
    lzma
    VERSION
    5.2.3-p2
    URL
    "https://github.com/hunter-packages/lzma/archive/v5.2.3-p2.tar.gz"
    SHA1
    758b108c2acb060ff4ddd9118d71809b3dd60427
)

hunter_add_version(
    PACKAGE_NAME
    lzma
    VERSION
    5.2.3-p4
    URL
    "https://github.com/hunter-packages/lzma/archive/v5.2.3-p4.tar.gz"
    SHA1
    09d7d8c8c8f1f488b3ccb739760c2092aae62441
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(lzma)
hunter_download(PACKAGE_NAME lzma)
