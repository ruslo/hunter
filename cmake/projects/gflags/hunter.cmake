# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    gflags
    VERSION
    2.1.2
    URL
    "https://github.com/gflags/gflags/archive/v2.1.2.tar.gz"
    SHA1
    8bdbade9d041339dc14b4ab426e2354a5af38478
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(gflags)
hunter_download(PACKAGE_NAME gflags)
