# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_botocore
    VERSION
    1.12.130
    URL
    "https://github.com/boto/botocore/archive/1.12.130.tar.gz"
    SHA1
    6c4d82b257c31606fb7e3af1f6d0d89bac30325d
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_botocore)
hunter_download(PACKAGE_NAME pip_botocore)
