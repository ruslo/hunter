# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    check_ci_tag
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/check_ci_tag/archive/v1.0.0.tar.gz"
    SHA1
    f220960c1174cda57a50a71d6037ca1c4fbbe796
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(check_ci_tag)
hunter_download(PACKAGE_NAME check_ci_tag)
