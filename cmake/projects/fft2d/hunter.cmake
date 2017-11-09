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
    fft2d
    VERSION
    1.0.0-p0
    URL
    "https://github.com/hunter-packages/fft2d/archive/v1.0.0-p0.tar.gz"
    SHA1
    080f5415229653fe032e981e4ce65a05a6967bbe
    )
  
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(fft2d)
hunter_download(PACKAGE_NAME fft2d)
