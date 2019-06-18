# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    mshadow
    VERSION
    1.1-696803b-p0
    URL
    "https://github.com/hunter-packages/mshadow/archive/v1.1-696803b-p0.tar.gz"
    SHA1
    34429211cc841afbde7f8f36994501836a36eb6f
)

hunter_add_version(
    PACKAGE_NAME
    mshadow
    VERSION
    1.1-1d79ecf-p0
    URL
    "https://github.com/hunter-packages/mshadow/archive/v1.1-1d79ecf-p0.tar.gz"
    SHA1
    45e424dc081ccd02f61ab58b59030e3da3890a8a
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mshadow)
hunter_download(PACKAGE_NAME mshadow)
