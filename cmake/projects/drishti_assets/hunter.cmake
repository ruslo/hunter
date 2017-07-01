# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    drishti_assets
    VERSION
    1.6
    URL
    "https://github.com/elucideye/drishti-assets/archive/v1.6.tar.gz"
    SHA1
    7787ba57e30146c979780c79ae62e8299cfe3cfd
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(drishti_assets)
hunter_download(PACKAGE_NAME drishti_assets)
