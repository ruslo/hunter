# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_urllib3
    VERSION
    1.24.1
    URL
    "https://github.com/urllib3/urllib3/archive/1.24.1.tar.gz"
    SHA1
    67cf61811cf7356be5fe60a5ff8dacbb74e54dcf
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_urllib3)
hunter_download(PACKAGE_NAME pip_urllib3)
