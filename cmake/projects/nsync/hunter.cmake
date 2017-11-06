# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    nsync
    VERSION
    1.14-p0
    URL
    "https://github.com/headupinclouds/nsync/archive/v1.14-p0.tar.gz"
    SHA1
    60458745a31046c1f674f34978235a134292d3c8
    )
  
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(nsync)
hunter_download(PACKAGE_NAME nsync)
