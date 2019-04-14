# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_requests
    VERSION
    2.21.0
    URL
    "https://github.com/kennethreitz/requests/archive/v2.21.0.tar.gz"
    SHA1
    03f02f356fc00936c492f54f4d4a403598e47333
)

set(
    __hunter_requests_deps
    pip_certifi
    pip_chardet
    pip_idna
    pip_urllib3
)

hunter_cmake_args(
    pip_requests
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=${__hunter_requests_deps}
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_requests)
hunter_download(PACKAGE_NAME pip_requests)
