# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    hunter_box_1
    VERSION
    1.0.0
    URL
    "https://github.com/hunterbox/hunter_box_1/archive/v1.0.0.tar.gz"
    SHA1
    4fa7fe75629f148a61cedc6ba0bce74f177a6747
)

hunter_add_version(
    PACKAGE_NAME
    hunter_box_1
    VERSION
    1.0.1
    URL
    "https://github.com/hunterbox/hunter_box_1/archive/v1.0.1.tar.gz"
    SHA1
    10d046eec6c8b0aabd28bd3d1b99faf6beeb226b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(hunter_box_1)
hunter_download(PACKAGE_NAME hunter_box_1)
