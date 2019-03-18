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
    Sqlpp11
    VERSION
    0.57-p0
    URL
    https://github.com/hunter-packages/sqlpp11/archive/v0.57-p0.tar.gz
    SHA1
    472f23489f9a063d2b9a492910ea59a36bc55263
)

hunter_cmake_args(Sqlpp11 CMAKE_ARGS 
  ENABLE_TESTS=OFF
)  

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Sqlpp11)
hunter_download(PACKAGE_NAME Sqlpp11)

