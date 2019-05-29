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

hunter_add_version(
    PACKAGE_NAME
    catkin
    VERSION
    0.7.11-p1
    URL
    "https://github.com/hunter-packages/catkin/archive/v0.7.11-p1.tar.gz"
    SHA1
    "465960e1a8bf849ef045a6d543ed23c5be84e36f"
)

hunter_add_version(
    PACKAGE_NAME
    catkin
    VERSION
    0.7.11-p2
    URL
    "https://github.com/hunter-packages/catkin/archive/v0.7.11-p2.tar.gz"
    SHA1
    "d8001b873e2482a48eeb6fe573f88fc4d6d63b7b"
)

hunter_add_version(
    PACKAGE_NAME
    catkin
    VERSION
    0.7.17-p0
    URL
    "https://github.com/hunter-packages/catkin/archive/v0.7.17-p0.tar.gz"
    SHA1
    "13aac5184149590d3da67eb23002da690e8df0a6"
)

hunter_cmake_args(
    catkin
    CMAKE_ARGS
        CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(catkin)
hunter_download(PACKAGE_NAME catkin)
