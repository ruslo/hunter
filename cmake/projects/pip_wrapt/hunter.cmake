# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_wrapt
    VERSION
    1.11.1
    URL
    "https://github.com/GrahamDumpleton/wrapt/archive/1.11.1.tar.gz"
    SHA1
    20677372a74167bd9a7eb312996a0cca90db593e
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_wrapt)
hunter_download(PACKAGE_NAME pip_wrapt)
