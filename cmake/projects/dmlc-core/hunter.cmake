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

hunter_add_version(
    PACKAGE_NAME
    dmlc-core
    VERSION
    0.0.0-mxnet-0a0e8ad-p0
    URL
    https://github.com/hunter-packages/dmlc-core/archive/0.0.0-mxnet-0a0e8ad-p0.tar.gz
    SHA1
    551ef4e0e51dfd6cdf79d766fe37e64a3a90d3e0
    )

hunter_add_version(
    PACKAGE_NAME
    dmlc-core
    VERSION
    0.0.0-946a540-p0
    URL
    https://github.com/hunter-packages/dmlc-core/archive/v0.0.0-946a540-p0.tar.gz
    SHA1
    e31258568ec9951272fd1a6a25a04e166931ebbd
    )

hunter_cmake_args(
  dmlc-core
  CMAKE_ARGS
  USE_OPENMP=OFF # since not all compilers support this
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(dmlc-core)
hunter_download(PACKAGE_NAME dmlc-core)
