# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    cpr
    VERSION
    1.3.0
    URL
    https://github.com/hunter-packages/cpr/archive/1.3.0-p.tar.gz
    SHA1
    6a44d4ed75cc75b21ff7612c319a0d9587fcf18d
)

hunter_cmake_args(cpr CMAKE_ARGS 
  BUILD_CPR_TESTS=OFF
  CMAKE_USE_OPENSSL=OFF
)  

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cpr)
hunter_download(PACKAGE_NAME cpr)
