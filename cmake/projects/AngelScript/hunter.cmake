# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    AngelScript
    VERSION
    2.30-p0
    URL
    "https://github.com/hunter-packages/AngelScript/archive/v2.30-p0.tar.gz"
    SHA1
    0323f68eb7d7c76d88c8d3193995bdf4cfff7f62
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(AngelScript)
hunter_download(PACKAGE_NAME AngelScript)
