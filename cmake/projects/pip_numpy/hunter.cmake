# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_numpy
    VERSION
    1.16.2
    URL
    "https://github.com/numpy/numpy/releases/download/v1.16.2/numpy-1.16.2.tar.gz"
    SHA1
    2a5a60f2b49befaf01a12dc66bab33d519af0cba
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_numpy)
hunter_download(PACKAGE_NAME pip_numpy)
