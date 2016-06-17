# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    openddlparser
    VERSION
    "0.1.0"
    URL
    "https://github.com/hunter-packages/openddl-parser/archive/v0.1.0.tar.gz"
    SHA1
    eea16c35cb5d053e6e540031d6df5ca9c5330f6b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(openddlparser)
hunter_download(PACKAGE_NAME openddlparser)
