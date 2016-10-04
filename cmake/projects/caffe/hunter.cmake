# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    caffe
    VERSION
    rc3-p0
    URL
    "https://github.com/hunter-packages/caffe/archive/rc3-p0.tar.gz"
    SHA1
    71fabb0590997004290b70c440f43255e939d1e2
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(caffe)
hunter_cmake_args(
    caffe
    CMAKE_ARGS
    BLAS=Open # OpenBLAS
    BUILD_docs=NO
    BUILD_matlab=NO
    BUILD_python=NO
    BUILD_python_layer=NO
    CPU_ONLY=YES
    USE_LEVELDB=NO
    USE_LMDB=NO
    USE_OPENCV=NO
)

hunter_download(PACKAGE_NAME caffe)
