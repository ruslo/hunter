# Copyright (c) 2016 Alexey Ulyanov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "1.5.9"
    URL
    "https://github.com/hunter-packages/Catch/archive/v1.5.9-hunter.tar.gz"
    SHA1
    76b2793989314a75ec50c4e4aa4df27daae912a0
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Catch)
hunter_download(PACKAGE_NAME Catch)
