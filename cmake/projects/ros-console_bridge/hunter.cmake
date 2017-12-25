# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ros-console_bridge
    VERSION
    0.4.0-p0
    URL
    "https://github.com/hunter-packages/console_bridge/archive/v0.4.0-p0.tar.gz"
    SHA1
    "2765cbadb6296f615cfb10f2a58cb54193a8bc80"
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros-console_bridge)
hunter_download(PACKAGE_NAME ros-console_bridge)
