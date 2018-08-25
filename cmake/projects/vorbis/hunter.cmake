# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    vorbis
    VERSION
    1.3.6-p1
    URL
    "https://github.com/hunter-packages/vorbis/archive/v1.3.6-p1.tar.gz"
    SHA1
    51cdcdbd872d85f3cf2d5515baf9ccaa13690d1a
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(vorbis)
hunter_download(PACKAGE_NAME vorbis)
