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
    rc3-p2
    URL
    "https://github.com/hunter-packages/caffe/archive/rc3-p2.tar.gz"
    SHA1
    b084ed037b2f0e14de9a4cfddad303edeebcba7c
)

hunter_add_version(
    PACKAGE_NAME
    caffe
    VERSION
    rc3-p1
    URL
    "https://github.com/hunter-packages/caffe/archive/rc3-p1.tar.gz"
    SHA1
    d83c48d6d11d7d7b2b723b17963d205b53ed0efc
)

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
)

hunter_download(PACKAGE_NAME caffe)
