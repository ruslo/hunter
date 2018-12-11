# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    dlpack
    VERSION
    "0.2-p0"
    URL
    "https://github.com/hunter-packages/dlpack/archive/v0.2-p0.tar.gz"
    SHA1
    0ecb2a1bbf1f5578e92c11f1deda96cf625eb401
)

hunter_add_version(
    PACKAGE_NAME
    dlpack
    VERSION
    "0.2-bee4d1d-p0"
    URL
    "https://github.com/hunter-packages/dlpack/archive/v0.2-bee4d1d-p0.tar.gz"
    SHA1
    86a28f7458fc029dea30a096e2e0f4b78c7719be
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(dlpack)
hunter_download(PACKAGE_NAME dlpack)
