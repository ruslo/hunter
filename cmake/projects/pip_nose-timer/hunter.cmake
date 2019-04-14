# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_nose-timer
    VERSION
    0.7.5
    URL
    "https://github.com/mahmoudimus/nose-timer/archive/v0.7.5.tar.gz"
    SHA1
    ac66d620dcb3b06eee43e0c6955bc4c56852ad89
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_nose-timer)
hunter_download(PACKAGE_NAME pip_nose-timer)
