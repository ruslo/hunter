# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    prometheus-cpp
    VERSION
    0.6.0-p2
    URL
    "https://github.com/hunter-packages/prometheus-cpp/archive/v0.6.0-p2.tar.gz"
    SHA1
    43ef1b4c9e0867f979a5579ee9b5fd80652d7919
)

hunter_cmake_args(
    prometheus-cpp
    CMAKE_ARGS
        ENABLE_TESTING=OFF
        USE_THIRDPARTY_LIBRARIES=OFF
        OVERRIDE_CXX_STANDARD_FLAGS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(prometheus-cpp)
hunter_download(PACKAGE_NAME prometheus-cpp)
