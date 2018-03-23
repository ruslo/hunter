# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    lcms
    VERSION
    2.9-p0
    URL
    "https://github.com/hunter-packages/Little-CMS/archive/v2.9-p0.tar.gz"
    SHA1
    5bea20d0e6e98b743e5e72ba1c130e13b9b73584
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(lcms)
hunter_download(PACKAGE_NAME lcms)
