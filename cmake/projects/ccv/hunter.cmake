# Copyright (c) 2015, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_add_package)

hunter_add_version(
    PACKAGE_NAME
    ccv
    VERSION
    "0.7-p6"
     URL
     "https://github.com/hunter-packages/ccv/archive/v0.7-p6.tar.gz"
     SHA1
     6fdcc8fe0e31a169a3fb26df7c694873208ccc44
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_download(PACKAGE_NAME ccv)
