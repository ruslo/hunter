# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    bar
    VERSION
    1.0.0
    URL
    "https://github.com/forexample/bar/archive/v1.0.0.tar.gz"
    SHA1
    cb0223f9478a886f497ee4f4dc4a89cd95648fcd
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(bar)
hunter_download(PACKAGE_NAME bar)
