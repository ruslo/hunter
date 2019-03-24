# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    rang
    VERSION
    3.1.0-p0
    URL
    "https://github.com/hunter-packages/rang/archive/v3.1.0-p0.tar.gz"
    SHA1
    6a49f08c81009e2ab513b3d62e3c5fbc7efab882
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(rang)
hunter_download(PACKAGE_NAME rang)
