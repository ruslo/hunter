# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    OpenSceneGraph
    VERSION
    "3.6.3-p0"
    URL
    "https://github.com/hunter-packages/OpenSceneGraph/archive/v3.6.3-p0.tar.gz"
    SHA1
    0c9eab9364fa1d2d0451c565650851a167f02fe4
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenSceneGraph)
hunter_download(PACKAGE_NAME OpenSceneGraph)
