# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.
#ok
# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    qhull
    VERSION
    7.2.0-p0
    URL
    "https://github.com/hunter-packages/qhull/archive/v7.2.0-p0.tar.gz"
    SHA1
    17ee22ce8b2814aecb300f31cecf3fb4971b2f1f
)

hunter_add_version(
    PACKAGE_NAME
    qhull
    VERSION
    7.2.0-p1
    URL
    "https://github.com/hunter-packages/qhull/archive/v7.2.0-p1.tar.gz"
    SHA1
    48e45eab0d6331403539bd2f3408e02eba7a0256
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(qhull)
hunter_download(PACKAGE_NAME qhull)
