# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    civetweb
    VERSION
    1.10-p1
    URL
    "https://github.com/hunter-packages/civetweb/archive/v1.10-p1.tar.gz"
    SHA1
    151d705b4c8eb3fe81b273da6ef65ad8a4c1ef8a
)

hunter_cmake_args(
    civetweb
    CMAKE_ARGS
    BUILD_TESTING=OFF
    CIVETWEB_ENABLE_ASAN=OFF
    CIVETWEB_ENABLE_SSL_DYNAMIC_LOADING=OFF
    CIVETWEB_INSTALL_EXECUTABLE=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(civetweb)
hunter_download(PACKAGE_NAME civetweb)
