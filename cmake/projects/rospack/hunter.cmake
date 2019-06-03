# Copyright (c) 2017, Lukas Solanka
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    rospack
    VERSION
    2.5.0-p0
    URL
    "https://github.com/hunter-packages/rospack/archive/v2.5.0-p0.tar.gz"
    SHA1
    "3ed739a889b0a17f3ece52b7910e221c1f002de9"
)

hunter_add_version(
    PACKAGE_NAME
    rospack
    VERSION
    2.5.3-p0
    URL
    "https://github.com/hunter-packages/rospack/archive/v2.5.3-p0.tar.gz"
    SHA1
    "6f233779d0540a45dfe6f88b25fd740d03db9ade"
)

hunter_cmake_args(
    rospack
    CMAKE_ARGS
        CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(rospack)
hunter_download(PACKAGE_NAME rospack)
