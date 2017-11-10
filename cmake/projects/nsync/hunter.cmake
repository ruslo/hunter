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
    1.14-p1
    URL
    "https://github.com/hunter-packages/nsync/archive/v1.14-p1.tar.gz"
    SHA1
    ba52dbd178fc5162aac4469b67c0b5a684e37075
    )
  
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(nsync)
hunter_download(PACKAGE_NAME nsync)
