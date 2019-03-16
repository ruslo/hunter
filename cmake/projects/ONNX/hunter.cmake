# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ONNX
    VERSION
    1.4.1-p0
    URL
    "https://github.com/hunter-packages/onnx/archive/v1.4.1-p0.tar.gz"
    SHA1
    70032d6e55c61a6716203cbf44a5773318d2f86e
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ONNX)
hunter_download(PACKAGE_NAME ONNX)
