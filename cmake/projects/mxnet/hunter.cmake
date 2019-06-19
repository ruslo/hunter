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
    mxnet
    VERSION
    0.0.0-5b86701f2-p0
    URL
    "https://github.com/hunter-packages/mxnet/archive/0.0.0-5b86701f2-p0.tar.gz"
    SHA1
    8b7d898d2f474bef2ca436cca2c2ab15483535cd
)

hunter_add_version(
    PACKAGE_NAME
    mxnet
    VERSION
    0.0.0-5b86701f2-p1
    URL
    "https://github.com/hunter-packages/mxnet/archive/0.0.0-5b86701f2-p1.tar.gz"
    SHA1
    71c01aaa65448f4826e2ec4cadb44987370d664f
)

hunter_add_version(
    PACKAGE_NAME
    mxnet
    VERSION
    0.0.0-5b86701f2-p2
    URL
    "https://github.com/hunter-packages/mxnet/archive/0.0.0-5b86701f2-p2.tar.gz"
    SHA1
    60c4d0ef4b9ac35e6a23c5482a1702da7e377d5c
)

hunter_add_version(
    PACKAGE_NAME
    mxnet
    VERSION
    1.4.0-p2
    URL
    "https://github.com/hunter-packages/mxnet/archive/v1.4.0-p2.tar.gz"
    SHA1
    bb80e4b173d2630313195f38d528f2d2d42455c3
)

hunter_add_version(
    PACKAGE_NAME
    mxnet
    VERSION
    1.4.0-p3
    URL
    "https://github.com/hunter-packages/mxnet/archive/v1.4.0-p3.tar.gz"
    SHA1
    aa01fea9b74bd4a10f5a1d028e61be62c4536bd0
)

hunter_add_version(
    PACKAGE_NAME
    mxnet
    VERSION
    1.5.0.rc1-b64e00a-p0
    URL
    "https://github.com/hunter-packages/mxnet/archive/v1.5.0.rc1-b64e00a-p0.tar.gz"
    SHA1
    01c400835d280a7ffec86361d17a2a10b3851998
)

set(
    __hunter_mxnet_args
    BUILD_CPP_EXAMPLES=OFF
    BUILD_TESTS=OFF
    USE_CPP_PACKAGE=ON
    USE_GPERFTOOLS=OFF
    USE_JEMALLOC=OFF
    USE_OPENMP=OFF
)

if(APPLE)
  list(
      APPEND
      __hunter_mxnet_args
      BLAS=apple
      USE_CUDA=OFF
      USE_LAPACK=OFF
  )
else()
  list(
      APPEND
      __hunter_mxnet_args
      USE_LAPACK=OFF
  )
endif()

hunter_cmake_args(mxnet CMAKE_ARGS ${__hunter_mxnet_args})

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mxnet)
hunter_download(PACKAGE_NAME mxnet)
