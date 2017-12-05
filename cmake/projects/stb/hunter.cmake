# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    stb
    VERSION
    0.0.1
    URL
    "https://github.com/hunter-packages/stb/archive/v0.0.1.tar.gz"
    SHA1
    270aefc345550c229507b37c35b9d5de7ba3a052
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(stb)
hunter_download(PACKAGE_NAME stb)
