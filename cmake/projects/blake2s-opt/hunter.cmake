# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    blake2s-opt
    VERSION
    1.0.0
    URL
    "https://github.com/Warchant/blake2s-opt/archive/1.0.0.tar.gz"
    SHA1
    c7bfefe46e8a69ff95dbf6ddf1c2a06b7d01d3a4
)

hunter_pick_scheme(DEFAULT url_sha1_configure_make_blake2s_only)
hunter_cacheable(blake2s-opt)
hunter_download(PACKAGE_NAME blake2s-opt)
