# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

 # !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

 hunter_add_version(
    PACKAGE_NAME
    nanosvg
    VERSION
    "0.0.0-2b08dee-p0"
    URL
    "https://github.com/hunter-packages/nanosvg/archive/v0.0.0-2b08dee-p0.tar.gz"
    SHA1
    ee4b86de4478fc912510bada2341d4f8faa8feaf
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(nanosvg)
hunter_download(PACKAGE_NAME nanosvg)
