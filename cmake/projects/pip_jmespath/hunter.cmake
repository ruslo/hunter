# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_jmespath
    VERSION
    0.9.4
    URL
    "https://github.com/jmespath/jmespath.py/archive/0.9.4.tar.gz"
    SHA1
    203f430114ffc35a86e8070c434367f2e080f7ea
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_jmespath)
hunter_download(PACKAGE_NAME pip_jmespath)
