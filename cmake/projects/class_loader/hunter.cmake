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
    class_loader
    VERSION
    0.4.1-p0
    URL
    "https://github.com/hunter-packages/class_loader/archive/v0.4.1-p0.tar.gz"
    SHA1
    43e3227edd9131a3b4d9e655e60dbba7cd26c3ed
)

hunter_cmake_args(
    class_loader
    CMAKE_ARGS
    BUILD_SHARED_LIBS:BOOL=ON
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(class_loader)
hunter_download(PACKAGE_NAME class_loader)
