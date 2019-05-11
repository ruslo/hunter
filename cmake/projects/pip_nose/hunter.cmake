# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_nose
    VERSION
    1.3.7
    URL
    "https://github.com/nose-devs/nose/archive/release_1.3.7.tar.gz"
    SHA1
    19ed6623b0c41dee05e07fae08faaff960c3307a
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_nose)
hunter_download(PACKAGE_NAME pip_nose)
