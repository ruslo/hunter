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
    45a920a4318698276d8c3cb9f39401091afce0fa
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(qhull)
hunter_download(PACKAGE_NAME qhull)
