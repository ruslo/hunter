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

hunter_add_version(
    PACKAGE_NAME
    dmlc-core
    VERSION
    0.3-d07fb7a-p0
    URL
    "https://github.com/hunter-packages/dmlc-core/archive/v0.3-d07fb7a-p0.tar.gz"
    SHA1
    4f0abf7a0a06091d2c26de073d992e239fd6e63f
    )

hunter_add_version(
    PACKAGE_NAME
    dmlc-core
    VERSION
    0.3-d07fb7a-p1
    URL
    "https://github.com/hunter-packages/dmlc-core/archive/v0.3-d07fb7a-p1.tar.gz"
    SHA1
    3185100daf1942e7fdd7707fa71a3e8598232913
    )

hunter_add_version(
    PACKAGE_NAME
    dmlc-core
    VERSION
    0.3-d07fb7a-p2
    URL
    "https://github.com/hunter-packages/dmlc-core/archive/v0.3-d07fb7a-p2.tar.gz"
    SHA1
    027989d7f4e4c2bc805ebee08a405e4236e39b73
    )

hunter_add_version(
    PACKAGE_NAME
    dmlc-core
    VERSION
    0.3-3943914-p0
    URL
    "https://github.com/hunter-packages/dmlc-core/archive/v0.3-3943914-p0.tar.gz"
    SHA1
    b81c6bc89f4887971c472bfeefdc756083d13966
    )

hunter_cmake_args(
  dmlc-core
  CMAKE_ARGS
  USE_OPENMP=OFF # since not all compilers support this

  # '/usr/include' leaking into compilation will ruine everything
  # - https://travis-ci.org/ingenue/hunter/jobs/510403904
  # -- Found Backtrace: /usr/include
  CMAKE_DISABLE_FIND_PACKAGE_Backtrace=ON
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(dmlc-core)
hunter_download(PACKAGE_NAME dmlc-core)
