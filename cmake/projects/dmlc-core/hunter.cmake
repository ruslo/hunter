# Copyright (c) 2016-2018, Ruslan Baratov
# Copyright (c) 2018, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    dmlc-core
    VERSION
    0.0.0-p1
    URL
    https://github.com/hunter-packages/dmlc-core/archive/v0.0.0-p1.tar.gz
    SHA1
    ba306bb39910c2bb635fb034150b1afde0a6660c
    )

hunter_add_version(
    PACKAGE_NAME
    dmlc-core
    VERSION
    0.0.0-p0
    URL
    https://github.com/hunter-packages/dmlc-core/archive/v0.0.0-p0.tar.gz
    SHA1
    f2fbfca630b897e75507e8d3e9e05cc00eee6e8e
    )

hunter_cmake_args(
  dmlc-core
  CMAKE_ARGS
  USE_OPENMP=OFF # since not all compilers support this
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(dmlc-core)
hunter_download(PACKAGE_NAME dmlc-core)

