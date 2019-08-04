# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    pluginlib
    VERSION
    1.12.1-p0
    URL
    "https://github.com/hunter-packages/pluginlib/archive/v1.12.1-p0.tar.gz"
    SHA1
    602a153b9d4bde918e7a4090f38eed60b64f8547
)

hunter_cmake_args(
    pluginlib
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(pluginlib)
hunter_download(PACKAGE_NAME pluginlib)
