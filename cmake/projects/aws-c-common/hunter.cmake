# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    aws-c-common
    VERSION
    0.2.1-p0
    URL
    "https://github.com/hunter-packages/aws-c-common/archive/v0.2.1-p0.tar.gz"
    SHA1
    65cf17a47d77054a4c043ef9c59978c872f8ed3d
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(aws-c-common)
hunter_download(PACKAGE_NAME aws-c-common)
