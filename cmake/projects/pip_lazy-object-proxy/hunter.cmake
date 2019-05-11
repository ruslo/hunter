# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_lazy-object-proxy
    VERSION
    1.3.1
    URL
    "https://github.com/ionelmc/python-lazy-object-proxy/archive/v1.3.1.tar.gz"
    SHA1
    ce01a65239f634c64b72a4dc9054026872fafd64
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_lazy-object-proxy)
hunter_download(PACKAGE_NAME pip_lazy-object-proxy)
