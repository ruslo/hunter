# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    mojoshader
    VERSION
    0.0.1
    URL
    "https://github.com/hunter-packages/mojoshader/archive/v0.0.1.tar.gz"
    SHA1
    177e1a81bf0fe0253ee111ca679b69c61685e79c
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mojoshader)
hunter_download(PACKAGE_NAME mojoshader)
