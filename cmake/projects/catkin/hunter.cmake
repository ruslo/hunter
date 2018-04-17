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
    catkin
    VERSION
    0.7.11-p0
    URL
    "https://github.com/hunter-packages/catkin/archive/v0.7.11-p0.tar.gz"
    SHA1
    "f7d64b4908fe800e5ec128e78e8e2f5bb5c955b3"
)

hunter_cmake_args(
    catkin
    CMAKE_ARGS
        CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(catkin)
hunter_download(PACKAGE_NAME catkin)
