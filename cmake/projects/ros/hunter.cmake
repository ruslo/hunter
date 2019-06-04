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
    ros
    VERSION
    1.14.4-p0
    URL
    "https://github.com/hunter-packages/ros/archive/v1.14.4-p0.tar.gz"
    SHA1
    "9ca792b460313dbe161760713abb24dd28d3b35d"
)

hunter_add_version(
    PACKAGE_NAME
    ros
    VERSION
    1.14.6-p0
    URL
    "https://github.com/hunter-packages/ros/archive/v1.14.6-p0.tar.gz"
    SHA1
    "fb44ebcebcc17664ddd6324366beee9ee90d2a2d"
)

hunter_cmake_args(
    ros_message_generation
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros)
hunter_download(PACKAGE_NAME ros)
