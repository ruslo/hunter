# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.3.0"
    URL
    "https://github.com/ruslo/sugar/archive/v1.3.0.tar.gz"
    SHA1
    155a48bbb588c34afc73dbc6ee87737b8f53f749
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Sugar)
hunter_download(PACKAGE_NAME Sugar)
