# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_six
    VERSION
    1.12.0
    URL
    "https://github.com/benjaminp/six/archive/1.12.0.tar.gz"
    SHA1
    eb86fb797c4be6069ed821113cc908bc02774175
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_six)
hunter_download(PACKAGE_NAME pip_six)
