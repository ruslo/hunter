# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    nlohmann_fifo_map
    VERSION
    "0.0.0-0dfbf5d-p1"
    URL
    "https://github.com/hunter-packages/fifo_map/archive/v0.0.0-0dfbf5d-p1.tar.gz"
    SHA1
    5361545721631631fd0cb4112f888cba8a2ef7ef
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(nlohmann_fifo_map)
hunter_download(PACKAGE_NAME nlohmann_fifo_map)
