# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_chardet
    VERSION
    3.0.4
    URL
    "https://github.com/chardet/chardet/archive/3.0.4.tar.gz"
    SHA1
    bf740348e002581b026dc4af47d56479097c1fcd
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_chardet)
hunter_download(PACKAGE_NAME pip_chardet)
