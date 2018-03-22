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
    jasper
    VERSION
    2.0.14-p0
    URL
    "https://github.com/hunter-packages/jasper/archive/v2.0.14-p0.tar.gz"
    SHA1
    e443966cfacdad2e3f975ba31d72333e06b433b4
)

hunter_cmake_args(
    jasper
    CMAKE_ARGS
    JAS_ENABLE_AUTOMATIC_DEPENDENCIES=OFF
    JAS_ENABLE_OPENGL=OFF
    JAS_ENABLE_PROGRAMS=OFF
    JAS_ENABLE_DOC=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(jasper)
hunter_download(PACKAGE_NAME jasper)
