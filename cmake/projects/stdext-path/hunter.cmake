# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    stdext-path
    VERSION
    0.0.1-p0
    URL
    "https://github.com/hunter-packages/stdext-path/archive/v0.0.1-p0.tar.gz"
    SHA1
    154e7497854fc8fa6e604d4b351902f69824e110
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(stdext-path)
hunter_download(PACKAGE_NAME stdext-path)
