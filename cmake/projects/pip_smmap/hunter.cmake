# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_smmap
    VERSION
    2.0.5
    URL
    "https://github.com/gitpython-developers/smmap/archive/v2.0.5.tar.gz"
    SHA1
    ea9a04d7ab8e32f4d458da84906a7cd2ba94f97c
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_smmap)
hunter_download(PACKAGE_NAME pip_smmap)
