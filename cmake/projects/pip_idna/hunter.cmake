# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_idna
    VERSION
    2.8
    URL
    "https://github.com/kjd/idna/archive/v2.8.tar.gz"
    SHA1
    7ca7e073f13574f51ddcfa3cc1a2e5789e895d9b
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_idna)
hunter_download(PACKAGE_NAME pip_idna)
