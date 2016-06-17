# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    convertutf
    VERSION
    "1.0.0"
    URL
    "https://github.com/hunter-packages/convertutf/archive/v1.0.0.tar.gz"
    SHA1
    757b75fff721260620050bc54096150ffd335672
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(convertutf)
hunter_download(PACKAGE_NAME convertutf)
