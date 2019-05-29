# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ros_console_bridge
    VERSION
    0.4.0-p0
    URL
    "https://github.com/hunter-packages/ros_console_bridge/archive/v0.4.0-p0.tar.gz"
    SHA1
    "0ed03b76b1289b5399b5dfdd4a4002596239a06f"
)

hunter_add_version(
    PACKAGE_NAME
    ros_console_bridge
    VERSION
    0.4.3-p0
    URL
    "https://github.com/hunter-packages/ros_console_bridge/archive/v0.4.3-p0.tar.gz"
    SHA1
    "9c1827626891522b626059d66cd3f32d9e99c931"
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_console_bridge)
hunter_download(PACKAGE_NAME ros_console_bridge)
