# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SimpleSignal
    VERSION
    0.0.0-79c3f68-p1
    URL
    "https://github.com/hunter-packages/SimpleSignal/archive/v0.0.0-79c3f68-p1.tar.gz"
    SHA1
    27ab940b3d803bb19311b993c76dfaf675aabfdd
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SimpleSignal)
hunter_download(PACKAGE_NAME SimpleSignal)
